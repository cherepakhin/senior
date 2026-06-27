#!/usr/bin/env python3

import asyncio
import websockets
import sys
import wave
import json
# Use:
# python3 ./test_short.py mishka.wav > mishka_out.txt

async def run_test(uri):
    async with websockets.connect(uri) as websocket:

        wf = wave.open(sys.argv[1], "rb")
        await websocket.send('{ "config" : { "sample_rate" : %d } }' % (wf.getframerate()))
        print('wf.getframerate():', wf.getframerate())
        buffer_size = int(wf.getframerate() * 0.2) # 0.2 seconds of audio
        while True:
            data = wf.readframes(buffer_size)

            if len(data) == 0:
                break

            await websocket.send(data)
            word = await websocket.recv()
            print('---------------')
            print(word)
            #print (await websocket.recv())

        print('FINISH====================')
        await websocket.send('{"eof" : 1}')
        result = await websocket.recv()
        print (result)
        print('RESULT====================')
        data_json = json.loads(result)
        print (data_json["text"])

asyncio.run(run_test('ws://localhost:2700'))
