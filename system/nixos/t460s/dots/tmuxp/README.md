# tmuxp session templates

## Usage

Load a session:
```sh
tmuxp load ~/.config/tmuxp/<name>.yaml
```

List available templates:
```sh
ls ~/.config/tmuxp/*.yaml
```

## Create a new template

Copy an existing template and adjust `session_name` and `start_directory`:
```sh
cp ~/.config/tmuxp/sandbox.yaml ~/.config/tmuxp/myproject.yaml
```

Minimal template structure:
```yaml
session_name: myproject
start_directory: ~/path/to/project

windows:
  - window_name: edit
    panes:
      - shell_command: ""

  - window_name: test
    panes:
      - shell_command: ""
```

## Available templates

| File               | Session        | Directory                              |
|--------------------|----------------|----------------------------------------|
| nixos-t460s.yaml   | nixos-t460s    | ~/slm-industries/system/nixos/t460s    |
| sandbox.yaml       | sandbox        | ~/ws/sandbox                           |
| enterprise.yaml    | enterprise     | ~/slm-industries                       |

## Freeze an existing session

Capture a running tmux session as a new template:
```sh
tmuxp freeze <session-name>
```

The file is saved to `~/.config/tmuxp/<session-name>.yaml` and can be edited afterwards.
