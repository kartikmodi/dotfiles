#sudo -H -u searx -i
. /usr/local/searx/searx-pyenv/bin/activate
cd /usr/local/searx/searx-src
export SEARX_SETTINGS_PATH="/etc/searx/settings.yml"
python searx/webapp.py
