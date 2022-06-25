import json
from tweepy import OAuthHandler, Stream
from datetime import datetime

# Cadastrar as chaves de acesso
consumer_key = '***********************'
consumer_secret = '***********************'
access_token = '***********************'
access_token_secret = '***********************'

# Definir um arquivo de saída para armazenar os tweets coletados
data_hoje = datetime.now().strftime('%Y-%m-%d-%H-%M-%S')
out = open(f'collected_tweets{data_hoje}.txt', 'w')

# Implementar uma classe para conexão com o Twitter

class MyListener(Stream):

    def on_data(self, data):
        print(data)
        itemString = json.dumps(data)
        out.write(itemString + '\n')
        return True
    
    def on_error(self, status):
        print(status)

# Implementar nossa função MAIN

if __name__ == '__main__':
    l = MyListener()
    auth = OAuthHandler(consumer_key, consumer_secret)
    auth.set_access_token(access_token, access_token_secret)

    stream = Stream(auth, l)
    stream.filter(track=['Eleições'])