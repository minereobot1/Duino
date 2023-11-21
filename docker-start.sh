#!/bin/bash

# Set the base path without the version number
base_path="/app/duino-coin/Duino-Coin PC Miner"

# Find the highest version number in the folder
highest_version=$(ls -d "${base_path}"/*/ | grep -Eo '[0-9.]+' | sort -Vr | head -n 1)

# Construct the full path with the highest version number
full_path="${base_path} ${highest_version}"

echo '[PC Miner]' > "${full_path}/Miner_config.cfg"
echo "username = ${DUCO_USERNAME}" >> "${full_path}/Miner_config.cfg"
echo "mining_key = $(echo -n ${DUCO_MINING_KEY} | base64)" >> "${full_path}/Miner_config.cfg"
echo "intensity = ${DUCO_INTENSITY}" >> "${full_path}/Miner_config.cfg"
echo "threads = ${DUCO_THREADS}" >> "${full_path}/Miner_config.cfg"
echo "start_diff = ${DUCO_START_DIFF}" >> "${full_path}/Miner_config.cfg"
echo "donate = ${DUCO_DONATE}" >> "${full_path}/Miner_config.cfg"
echo "identifier = ${DUCO_IDENTIFIER}" >> "${full_path}/Miner_config.cfg"
echo "algorithm = ${DUCO_ALGORITHM}" >> "${full_path}/Miner_config.cfg"
echo "language = ${DUCO_LANGUAGE}" >> "${full_path}/Miner_config.cfg"
echo "soc_timeout = ${DUCO_SOC_TIMEOUT}" >> "${full_path}/Miner_config.cfg"
echo "report_sec = ${DUCO_REPORT_SEC}" >> "${full_path}/Miner_config.cfg"
echo "raspi_leds = ${DUCO_RASPI_LEDS}" >> "${full_path}/Miner_config.cfg"
echo "raspi_cpu_iot = ${DUCO_RASPI_CPU_IOT}" >> "${full_path}/Miner_config.cfg"
echo "discord_rp = ${DUCO_DISCORD_RP}" >> "${full_path}/Miner_config.cfg"

chmod +x "${full_path}/PC_Miner.py"
python3 "${full_path}/PC_Miner.py"
