envsubst '${PORT}' < /etc/template/default.template > /etc/nginx/sites-enabled/default
service nginx restart
redis-server --daemonize yes
nohup /usr/bin/gorse-master -c /etc/gorse/config.toml &
nohup /usr/bin/gorse-worker &
echo "HEROKU PORT: $PORT"
/usr/bin/gorse-server