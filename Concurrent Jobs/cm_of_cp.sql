 select b.USER_CONCURRENT_QUEUE_NAME
from fnd_concurrent_processes a,
fnd_concurrent_queues_vl b, fnd_concurrent_requests c
where  a.CONCURRENT_QUEUE_ID = b.CONCURRENT_QUEUE_ID
and    a.CONCURRENT_PROCESS_ID = c.controlling_manager
and    c.request_id = 1383230701;
