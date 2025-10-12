
#WOL_CONF_MAP=()

function read_conf_file() {
    while IFS='=' read -r key value || [[ -n "$key" ]]; do
        # Skip comments and empty lines
        [[ "$key" =~ ^#.* ]] && continue
        [[ -z "$key" ]] && continue

        # Remove leading/trailing whitespace from key and value
        key=$(echo "$key" | xargs)
        value=$(echo "$value" | xargs)

        # Handle sections (optional, for INI-style files)
        if [[ "$key" =~ ^\[.*\]$ ]]; then
            SECTION=$(echo "$key" | tr -d '[]')
            continue
        fi

        # Assign variables
        if [[ -n "$SECTION" ]]; then
            #declare "${SECTION}_${key}"="$value"
            WOL_CONF_MAP["${key}"]="$value"
        else
            WOL_CONF_MAP["${key}"]="$value"
            echo ${key}
            #echo ${value}
            echo ${WOL_CONF_MAP['mint2']}
        fi
    done
}

conf_content=$(sed -e 's/\s*#.*$//g' wol1.conf)

#sed -e 's/\s*#.*$//g' wol1.conf | read_conf_file


#sed -e 's/\s*#.*$//g' wol1.conf | 
declare -A WOL_CONF_MAP
while IFS='=' read -r key value || [[ -n "$key" ]]; do
    [[ -z "$key" ]] && continue
    WOL_CONF_MAP["${key}"]="$value"
done < <(sed -e 's/\s*#.*$//g' wol1.conf) 
echo abc: ${WOL_CONF_MAP[mint2]}

#conf_content = sed -e 's/\s*#.*$//g' wol1.conf

#(sed -e 's/\s*#.*$//g' wol1.conf)
#echo "${config_map['mint']}"
#echo ${WOL_CONF_MAP['mint']}
#echo $mint

