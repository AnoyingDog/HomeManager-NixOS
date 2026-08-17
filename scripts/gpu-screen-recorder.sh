#!/usr/bin/env bash
pkill --signal SIGUSR1 -x gpu-screen-reco
notify-send "Clip saved" "Last 60s written to ~/Videos/Clips"
