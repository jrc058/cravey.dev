---
created: 2026-01-28
updated: 2026-01-28
tags: ["smart home", "home assistant", "self-hosting", "open-source", "AI", "projects"]
status: published
---

# Home Assistant Smart Home

[Home Assistant](https://www.home-assistant.io/) is a great tool for smart automations, run locally. I learned more about my data and my home from using Home Assistant more than most things. It can be really plug and play or super customizable depending on how you are, which might be a turn off for most, wife approval is a leading cause of failed Home Assistant projects.

The project started with help from Kiro, and somewhere along the line became a fun project to use local LLMs for, as well as learning some JSON myself, though I am partial to GUI.

## How We Built It

Kiro and I started with a docker container on the server. Leaving it at just that would be simple enough, downloading the integrations and just using it like that. I wanted a [Zigbee](https://zigbee2mqtt.io/) network and a [Z-Wave](https://www.z-wave.com/) network so I could be pretty agnostic. There are mixed reviews about Thread/Matter and Home Assistant, so I will wait for more support before migrating. As it stands, I'm really pleased with zigbee and zwave.

Kiro managed to make a lot of automations, with some back and forth for syntax. I gave Kiro access to all the entities and also let it come up with common, low hanging fruit to better my quality of life.

### Some Core Entities and Integrations

It's pretty innumerable, I think there's over 800 entities in my house. Which I guess is numerating it, but the acceleration that number grows feels unreachable.

#### Most Common

#### Lighting
[Philips Hue bulbs](https://www.amazon.com/dp/B0FMGP1P6W?th=1) for lights. I wanted to be anti-Philips but these expose a lot of entities which means more features. The ease of integration was simple, zigbee interviews.
I have 8 bulbs:
        - 2 in the garage turn on for an hour when my garage contact sensor detects the door opens
        - 2 nightstands in the primary
        - 4 lamps around the house
I'm big on small lights, not the big lights. So, naturally I can't say Philips without mentioning:

[Adaptive Lighting](https://github.com/basnijholt/adaptive-lighting) is absolutely necessary. Not because it needs it, but because I need it. It syncs with the sun.sun entity and uses some fancy parabolic timing sequence to calculate perfect light exposure for time of day. Throughout the day, the lights get colder or warmer depending on the time, with a lot of customizing presets if you like.

#### Security

Ring Ecosystem... Love hate relationship. I live a life of contradictions, and I work at Amazon but don't want Ring. But my house came with it so I use it. The Ring integration is lacking because Ring relies on it's own proprietary platform- which don't get me wrong is actually really nice and adds a lot of features actively, but I want all my services on one dashboard.

I'm very tired of being fragmented around services and apps and dashboards, I just want everything on my own service. Ring accomplishes that. The camera is it's own integration, with limited capabilities. I've tried RSTP with a Ring MQTT, but the service really just doesn't stream data. I have a Ring Pro account complementary because of the home plan, but the service does not stream the feed. I've had several minor successes, but it's too broken to work. It does take snapshots, and has a few exposed entities, just no live stream.

Ring alarm/hub, contact sensors, and keypad were found on the MQTT integration and are relatively fully featured. Can set modes, schedules, chirps, tones, etc. The contact sensors are pretty handy devices and I'd recommend.

#### Companion Apps

The companion apps allow for exposing phone entities and are assigned as the "Person". Android and iPhone experiences vary. Android exposed about 200 entities, iPhone something like 20. Android, or at least my GrapheneOS, do not host geolocation and I had to get a separate app to serve geolocation data to the server. iPhone works natively. So, experiences varies to say the least.

But it allows for notifications to be pushed, on completion of an automation or when an entity changes. When the "Person" gets in a geofence, automations can start, pretty configurable especially with security, lighting, energy, etc.

#### Climate

The ZWave Honeywell Home came with the house. It was finicky at first, but I think it's finally settled. It took some tinkering with wiring direct or battery powered, I think it likes battery powered if I remember, which doesn't let it be a repeater for the zwave network unfortunately.

### Oddity Entities

#### Torque Pro

OBDII adapter and Torque Pro is a crazy combination for Home Assistant. This was all Kiro. The OBDII sensor data exposed over 200 entities, but they aren't displayed in the entities list because it's a custom code integration. 

It shows everything from G-forces trip mileage to service information. It's a new-to-me integration and I have yet to digest the data, I just have a dashboard with a bunch of graphs that show different entities/sensors. 

There's frustrations with the integration because the Torque phone app says the units are in miles but everything is still in kilometers. So, I'm working through what the issue is, and if I can't find the issue I'm going to build a helper that converts the data to miles.

But once I get it up and running, the plan is to build out service reminders because I just dismiss that notification in the vehicle. Outside of service reminders, there's diagnostic information in the app itself, but I'd also like to have Home Assistant automatically make a maintenance log for my own records. Home Assistant will keep a record of the OBDII data points, which is nice because the OBDII adapter itself is just measuring live data. So the logs can live on Home Assistant, and with the service codes from the OBDII adapter, I can feed all that data to an LLM to help troubleshoot in the future. This will likely be a triage for vehicle problems before going to a mechanic.

#### SmartHub Energy

My utility provider does not integrate with Home Assistant, but [SmartHub Energy](https://github.com/gagata/ha-smarthub-energy-sensor) creatively gets around API usage and requires some browser console digging to get it up and working.

It only exposes usage rates, but integrates with the energy dashboard just fine and gives me insight into something I never look at because it's on a separate proprietary dashboard on another webpage that needs another login, about 5 steps too many for me to check frequently. This is just on my dashboard now.

### Others

I have a long list, but some other major integrations (native or through HACS):
- Android TV Remote
- CalDAV
- Ecowitt <-- Love, the company seems very Home Assistant friendly
- ESPHome
- Home Maintenance
- Immich - would like to use immich facial recognition with cameras
- Jellyfin - haven't really figured out much for this since I host jellyfin on another domain
- Local Calendar
- MQTT
- OwnTracks - Android geolocation
- Rain Bird - sprinklers
- Tailscale
... and a lot of others.


## What I Learned

Kiro did a lot of the heavy lifting, especially in the beginning. Part of that heavy lifting was just teaching me- not the platform itself, because that can all be done in the GUI, but with the config files and making it feel much more me. Custom dashboard creation got to be a breeze, just giving the entities I want, how I want it, and copying and pasting. Boom. Brand new dashboard.

I got decidedly involved in the house. I requested an electrical diagram and blueprint from the architect of the house, which was a hassle to get thanks to Lennar being the way they are. I got the diagram for something else a while back, but it got be thinking about electrical and smart devices. I learned a lot about retrofitting existing dumb devices, like normal light switches, with smart devices like shelly switches that live behind the switch, which I plan to get for the big lights.

I learned the most about networking technologies. MQTT, RSTP, WebRTC. Dockerized set up and containers speaking to containers. Getting ollama to talk was especially fun...

The Voice Assistant integration is still a work in progress, but it's forced me to learn about STT and TTS models and how they work.

## Current State

AI has been pretty hands-off since Home Assistant has become more established on the server. I have a cronjob that takes all the entities daily and adds it to my server documentation folder, and that folder is in my goose cli workspace so my AI always has latest entities.

I have dozens of automations routinely going. Lights turn on ambiently before my alarm goes off, turn off automatically when no one is home, turn back on when people are home, and turn off when it's bedtime. Security automations maintain alarm automatically so it arms away or home depending on a factor of environments. 

Dashboards show a great view at a glance, I haven't touched my main dashboard in ages now. It has lights, alarm, and critical things at a glance in a wife approved interface.

The home really is set up more than I had anticipated, and I could leave it as is and be perfectly content. However, my nature prevents that. It will continue being an ongoing project.

## What's Next

Voice control needs hardware deployment—the software is ready but need more Atom Echos placed around the house. I want to expand to more motion detection. There's more recent technology with Wi-Fi detecting presence similar to mmWave technology.