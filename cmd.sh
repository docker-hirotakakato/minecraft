#!/bin/sh -eu

cd /minecraft

rm -f ops.json ops.txt ops.txt.converted

if [ -n "${ops:-}" ]; then
  echo -e "${ops// /\\n}" > ops.txt
fi

cat > server.properties << EOF
broadcast-rcon-to-ops=${broadcast_rcon_to_ops:-true}
view-distance=${view_distance:-10}
max-build-height=${max_build_height:-256}
server-ip=${server_ip:-}
level-seed=${level_seed:-}
rcon.port=${rcon_port:-25575}
gamemode=${gamemode:-survival}
server-port=${server_port:-25565}
allow-nether=${allow_nether:-true}
enable-command-block=${enable_command_block:-false}
enable-rcon=${enable_rcon:-false}
enable-query=${enable_query:-false}
op-permission-level=${op_permission_level:-4}
prevent-proxy-connections=${prevent_proxy_connections:-false}
generator-settings=${generator_settings:-}
resource-pack=${resource_pack:-}
level-name=${level_name:-world}
rcon.password=${rcon_password:-}
player-idle-timeout=${player_idle_timeout:-0}
motd=${motd:-A Minecraft Server}
query.port=${query_port:-25565}
force-gamemode=${force_gamemode:-false}
hardcore=${hardcore:-false}
white-list=${white_list:-false}
broadcast-console-to-ops=${broadcast_console_to_ops:-true}
pvp=${pvp:-true}
spawn-npcs=${spawn_npcs:-true}
generate-structures=${generate_structures:-true}
spawn-animals=${spawn_animals:-true}
snooper-enabled=${snooper_enabled:-true}
difficulty=${difficulty:-easy}
function-permission-level=${function_permission_level:-2}
network-compression-threshold=${network_compression_threshold:-256}
level-type=${level_type:-default}
spawn-monsters=${spawn_monsters:-true}
max-tick-time=${max_tick_time:-60000}
enforce-whitelist=${enforce_whitelist:-false}
use-native-transport=${use_native_transport:-true}
max-players=${max_players:-20}
resource-pack-sha1=${resource_pack_sha1:-}
spawn-protection=${spawn_protection:-16}
online-mode=${online_mode:-true}
allow-flight=${allow_flight:-false}
max-world-size=${max_world_size:-29999984}
EOF

exec java -Xmx1G -Xms1G -jar /server.jar nogui
