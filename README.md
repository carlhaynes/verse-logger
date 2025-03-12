# verse-logger
A simple logger in verse to make debugging UEFN games a bit easier

~~~
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }


sample_device := class(creative_device):

    Logger<private>:logger = logger{}

    OnBegin<override>()<suspends>:void=
        Logger.debug("Hello, world!")
        Logger.error("2 + 2 = {3 + 2}")
~~~
