[Unit]
Description=Text Generation Web UI Service

[Service]
ExecStart=/home/paperspace/text-generation-webui/start_linux.sh
User=paperspace
Group=paperspace
Restart=always

[Install]
WantedBy=multi-user.target
