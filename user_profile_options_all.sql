SELECT
    fpovl.user_profile_option_name,
    fpov.profile_option_id,
    fu.user_name,
    fu.description,
    decode(fpov.level_id, 10001, 'SITE', 10002, 'APP',
           10003, 'RESP', 10004, 'USER') AS "Level",
    fpov.profile_option_value,
    fu1.description                      AS updated_by,
    fpov.last_update_date
FROM
         fnd_profile_option_values fpov
    JOIN fnd_profile_options_vl fpovl ON fpovl.profile_option_id = fpov.profile_option_id
    LEFT JOIN fnd_user               fu ON fpov.level_value = fu.user_id
    LEFT JOIN fnd_user               fu1 ON fpov.last_updated_by = fu1.user_id
WHERE
    fpovl.user_profile_option_name LIKE '%POS: External Responsibility Flag%'
       --AND fu.user_name IN ('212300075')
ORDER BY
    fpov.last_update_date DESC;

SELECT
    p.profile_option_name      short_name,
    n.user_profile_option_name name,
    decode(v.level_id,
           10001,
           'Site',
           10002,
           'Application',
           10003,
           'Responsibility',
           10004,
           'User',
           10005,
           'Server',
           10006,
           'Org',
           10007,
           decode(to_char(v.level_value2),
                  '-1',
                  'Responsibility',
                  decode(to_char(v.level_value),
                         '-1',
                         'Server',
                         'Server+Resp')),
           'UnDef')            level_set,
    decode(to_char(v.level_id),
           '10001',
           '',
           '10002',
           app.application_short_name,
           '10003',
           rsp.responsibility_key,
           '10004',
           usr.user_name,
           '10005',
           svr.node_name,
           '10006',
           org.name,
           '10007',
           decode(to_char(v.level_value2),
                  '-1',
                  rsp.responsibility_key,
                  decode(to_char(v.level_value),
                         '-1',
                         (
        SELECT
            node_name
        FROM
            fnd_nodes
        WHERE
            node_id = v.level_value2
    ),
                         (
        SELECT
            node_name
        FROM
            fnd_nodes
        WHERE
            node_id = v.level_value2
    )
                         || '-'
                         || rsp.responsibility_key)),
           'UnDef')            "CONTEXT",
    v.profile_option_value     value,
    v.last_update_date
FROM
    fnd_profile_options       p,
    fnd_profile_option_values v,
    fnd_profile_options_tl    n,
    fnd_user                  usr,
    fnd_application           app,
    fnd_responsibility        rsp,
    fnd_nodes                 svr,
    hr_operating_units        org
WHERE
        p.profile_option_id = v.profile_option_id (+)
    AND p.profile_option_name = n.profile_option_name
    AND upper(p.profile_option_name) IN (
        SELECT
            profile_option_name
        FROM
            fnd_profile_options_tl
        WHERE
            upper(p.profile_option_name) IN (
                SELECT
                    profile_option_name
                FROM
                    fnd_profile_options_vl
                WHERE
                    user_profile_option_name = 'Application Authenticate Agent'
            )
    )
    AND usr.user_id (+) = v.level_value
    AND rsp.application_id (+) = v.level_value_application_id
    AND rsp.responsibility_id (+) = v.level_value
    AND app.application_id (+) = v.level_value
    AND svr.node_id (+) = v.level_value
    AND org.organization_id (+) = v.level_value
ORDER BY
    short_name,
    user_profile_option_name,
    level_id,
    level_set;
