SELECT
    p.profile_option_name AS short_name,
    n.user_profile_option_name AS name,
    decode(v.level_id, 10005, 'Server') AS level_set,
    svr.node_name AS context,
    v.profile_option_value AS value,
    v.last_update_date
FROM
    fnd_profile_options p
    JOIN fnd_profile_option_values v ON p.profile_option_id = v.profile_option_id
    JOIN fnd_profile_options_tl n ON p.profile_option_name = n.profile_option_name
    LEFT JOIN fnd_nodes svr ON svr.node_id = v.level_value
WHERE
    v.level_id = 10005 -- Level ID for Server
ORDER BY
    short_name, name, level_set;
