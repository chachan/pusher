from celery import Celery
import pika

app = Celery('tasks')
app.conf.update(
    BROKER_URL='amqp://',
    CELERY_TASK_SERIALIZER='json',
    CELERY_ACCEPT_CONTENT=['json'],
    CELERY_RESULT_SERIALIZER='json',
    CELERY_TIMEZONE='America/Costa_Rica',
    CELERY_ENABLE_UTC=True,
)


@app.task
def add_message(message):
    connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
    channel = connection.channel()
    channel.queue_declare(queue='hello')
    channel.basic_publish(exchange='', routing_key='hello', body=message)
    connection.close()
    return message
