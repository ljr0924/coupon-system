import logging

logging.basicConfig(level=logging.DEBUG)

logger_name = 'coupon'

logger = logging.getLogger(logger_name)
logger.propagate = False

file_handler = logging.FileHandler(filename=f'{logger_name}.log', mode='a')
# 日志输出的格式 -8表示占位符，让输出左对齐，输出长度都为8位
fmt = '%(asctime)s - %(name)s - %(levelname)-9s - %(filename)-8s : %(lineno)s line - %(message)s'
formatter = logging.Formatter(fmt=fmt)

file_handler.setFormatter(formatter)

logger.addHandler(file_handler)
