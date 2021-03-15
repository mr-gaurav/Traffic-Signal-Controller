# Traffic Signal Controller

![image](https://user-images.githubusercontent.com/73470398/111209504-1a9cde00-85f2-11eb-8e93-0d8a495abf34.png)


 • The traffic signal for the main highway gets highest priority because cars are
continuously present on the main highway. Thus, the main highway signal
remains green by default.

• Occasionally, cars from the country road arrive at the traffic signal. The traffic
signal for the country road must turn green only long enough to let the cars on the
country road go.

• As soon as there are no cars on the country road, the country road traffic signal
turns yellow and then red and the traffic signal on the main highway turns green
again.

• There is a sensor to detect cars waiting on the country road. The sensor sends a
signal "signal" as input to the controller. 

• signal = 1 if there are cars on the country road, otherwise, signal= 0.
