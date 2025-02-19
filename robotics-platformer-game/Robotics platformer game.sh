#!/bin/sh
echo -ne '\033c\033]0;Konnie- Circuit Breaker\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Robotics platformer game.arm64" "$@"
