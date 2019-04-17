import time
from time import sleep
from fluent import sender
cur_time = int(time.time())

logger = sender.FluentSender('app', host='dev-fluentd-1', port=24224)

def sender(logs):
    logger.emit_with_time('follow', int(time.time()), logs)


n = 0
logs = {'message': 'starkov test massge', 'from': 'userA', 'to':'userB'}
#while n < 50:
#    sender(logs)
#    n += 1

#t_end = time.time() + 60
#while time.time() < t_end:
#    sender(logs)
while True:
    sender(logs)
    sleep(5)
