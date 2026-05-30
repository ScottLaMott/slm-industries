import psutil
import platform
import uuid
import json
import time
import httpx
import asyncio
from pathlib import Path

API_URL = "http://localhost:8000"
CONFIG_FILE = Path.home() / ".config" / "enterprise-tracker" / "device.json"

def get_or_create_device_id() -> dict:
    CONFIG_FILE.parent.mkdir(parents=True, exist_ok=True)
    if CONFIG_FILE.exists():
        return json.loads(CONFIG_FILE.read_text())
    config = {
        "device_id": str(uuid.uuid4()),
        "hostname": platform.node()
    }
    CONFIG_FILE.write_text(json.dumps(config))
    return config

def get_location() -> dict:
    try:
        r = httpx.get("https://ipinfo.io/json", timeout=5)
        loc = r.json().get("loc", "0,0").split(",")
        return {"latitude": float(loc[0]), "longitude": float(loc[1])}
    except Exception:
        return {"latitude": None, "longitude": None}

def collect_hardware() -> dict:
    disk = psutil.disk_usage("/")
    return {
        "cpu_percent":  round(psutil.cpu_percent(interval=1), 1),
        "ram_percent":  round(psutil.virtual_memory().percent, 1),
        "disk_percent": round(disk.percent, 1),
        "disk_free_gb": round(disk.free / 1024**3, 1),
        "ram_total_gb": round(psutil.virtual_memory().total / 1024**3, 1),
    }

async def send_report(client: httpx.AsyncClient, device: dict, hw: dict, loc: dict):
    payload = {**device, **hw, **loc}
    try:
        r = await client.post(f"{API_URL}/devices/report", json=payload, timeout=10)
        if r.status_code == 200:
            print(f"[Scotty] Daten gesendet — CPU: {hw['cpu_percent']}% | RAM: {hw['ram_percent']}% | Disk: {hw['disk_percent']}%")
        else:
            print(f"[Uhura] Fehler vom Server: {r.status_code}")
    except httpx.ConnectError:
        print("[Uhura] Server nicht erreichbar — wird erneut versucht...")

async def main():
    device = get_or_create_device_id()
    print(f"[Kirk] USS Enterprise Agent gestartet — Gerät: {device['hostname']} ({device['device_id'][:8]}...)")
    
    loc = get_location()
    print(f"[Spock] Standort ermittelt: {loc['latitude']}, {loc['longitude']}")

    async with httpx.AsyncClient() as client:
        while True:
            hw = collect_hardware()
            await send_report(client, device, hw, loc)
            
            # Scotty warnt bei kritischen Werten
            if hw["disk_percent"] > 90:
                print(f"[Scotty] WARNUNG: Festplatte zu {hw['disk_percent']}% voll!")
            if hw["ram_percent"] > 85:
                print(f"[Scotty] WARNUNG: RAM zu {hw['ram_percent']}% belegt!")

            await asyncio.sleep(30)  # alle 30 Sekunden

if __name__ == "__main__":
    asyncio.run(main())
