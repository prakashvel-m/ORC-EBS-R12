update fnd_concurrent_requests
    set  phase_code='C',
    status_code='X'
    where request_id in (1408888146,1408888153,1408888157,1408888159);
