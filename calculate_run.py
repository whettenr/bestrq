from datetime import datetime


info = {
    'w2v2': {
        'start': '2023-12-01 10:03:56',
        'end': '2023-12-02 02:18:38',
    },
    'bestrq-base': {
        'start': '2023-12-01 09:48:16',
        'end': '2023-12-01 16:31:51',
    },
    'bestrq-hc': {
        'start': '2023-12-01 09:54:39',
        'end': '2023-12-01 15:51:28',
    },
    'bestrq-hb': {
        'start': '2023-12-01 11:43:22',
        'end': '2023-12-01 16:26:38',
    },
}

start = datetime.strptime(info['w2v2']['start'], '%Y-%m-%d %H:%M:%S')
end = datetime.strptime(info['w2v2']['end'], '%Y-%m-%d %H:%M:%S')
w2v2_dif = end - start

for key in info:
    print(key)
    start = datetime.strptime(info[key]['start'], '%Y-%m-%d %H:%M:%S')
    end = datetime.strptime(info[key]['end'], '%Y-%m-%d %H:%M:%S')
    dif = end - start
    print(dif)  # printed in default format
    print((w2v2_dif - dif) / w2v2_dif)  # printed in default format
    print(w2v2_dif / dif)  # printed in default format



