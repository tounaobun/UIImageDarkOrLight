# UIImageDarkOrLight
Determine whether the given UIImage is dark or light in a standard way.

###

If you're only doing black or white text, use the color brightness calculation above. If it is below 125, use white text. If it is 125 or above, use black text.

edit 1: bias towards black text. :)

edit 2: The formula to use is ((Red value * 299) + (Green value * 587) + (Blue value * 114)) / 1000.

###

参考资料：
http://stackoverflow.com/questions/2509443/check-if-uicolor-is-dark-or-bright
    https://gist.github.com/justinHowlett/4611988