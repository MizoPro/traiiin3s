> [!WARNING]
> **STILL MERGING AND COLLECTING LOCAL DATA FOR UPLOAD**

# traiiin3s

A modern full-fledged Training Mode for the Arcade edition of **Street Fighter III: 3rd Strike**.

>Primarily made for *Street Fighter III 3rd Strike: Fight for the Future (Japan 990512, NO CD)* - a.k.a `sfiii3nr1.zip`. But, may work just fine for other versions. No guarantee though.

## Introduction

This is a complete Training mode with all of the features you would expect from one:

* Dummy Behaviour
* Counter-attack Settings
* Record/Replay Settings
* Toggleable **Gauges** for everything, *so many gauges* (I need help)
    - Input History, in multiple forms, inspired by multiple fighting games.
    - Hitboxes/Hurtboxes/Throwboxes.
    - Attack and damage data.
    - Juggle meter, for your fancy combos.
    - Frame meter and frame advantage.
    - Charge meters, for appropriate characters.
    - All Special Moves and Supers input state and buffer window.
    - *And many more to come..*
* And general Quality-of-Life features like fast navigation to character select screen, etc.

## Install

*First*: Download this mod from [**here**][Archive] or [*Releases*][Release] or just clone the repo.

```bash
git clone https://github.com/MizoPro/traiiin3s.git
```

*Then*: Extract it somewhere safe on your PC where you can find it and keep it there.


### BizHawk

1. Download [BizHawk] for your platform (tested on `v2.11`)
2. Get the proper `sfiii3nr1.zip` rom (Hint: MAME)
3. Open BizHawk, then `File > Open ROM`, find and select your `3S` rom file.
4. Once it's opened, select `Tools > Lua Console`.
5. In the new window, `File > Open Session`, find and select `traiiin3s.lua` inside the folder you just extracted.
6. Enjoy!

### Fightcade

1. Download [Fightcade] (tested on `v0.2.97.44`)
2. Get the proper `sfiii3nr1.zip` rom (Hint: Not MAME)
3. Navigate to where Fightcade is installed (`~/Documents/Fightcade` by default)
4. Go to `emulator` folder, then `fbneo` and launch `fcadeneo.exe` (Make a Desktop shortcut for future usage)
5. Select `Game > Load Game` (shortcut `F6`) and open `3S` rom file.
6. Once it's opened, Go to `Game > Lua Scripting... > New Lua Script Window...`
7. `Browse...` to find and select `traiiin3s.lua` inside the folder you just extracted. Then click `Run`.
8. Enjoy!

## Motivation

Street Fighter III: 3rd Strike is one of my favorite (fighting) games of all time. I love its art style, music, gameplay, etc. And I like most of the cast especially my boys Urien and Alex.

I noticed that I was spending the majority of my time playing this game in [**Grouflon's excellent Training mode**][Grouflon Training Mode] for Fightcade. Just chilling, trying Urien's various combos (e.g. `TTH`, midscreen Unblockables, etc) and other stuff like Ken's `LP Shoryuken |> (kara cancel) LP Shoryuken` etc.

I don't really play online. I'm kind of bad at the game lol. Also, I'm shy. Took me way too long to upload this ^_^

Anyways, I started tweaking the training mode and testing it.

**Mainly**, I wanted to implement **Street Fighter 6's amazing Frame meter**, because I was inspired by [**this fantastic mod**][GBVSR Frame Meter] for Granblue Fantasy: Versus that I love. But, I couldn't really pull it off. Simply, the mod was too complicated for me, and the fact that I *lowkey* **hate** `Lua` (uncomplete language that we choose to use for some reason).

Fast forward, I sort of switched off to using `BizHawk`, because it felt more responsive and, for me, it had more potential for coding because of its various tools and features (`RAM Watch`, `HexEditor`, etc)

This is where I encountered the sad reality that `3rd_training_lua` doesn't work in `BizHawk`, as a matter of fact, I couldn't find a single training mode for `BizHawk`. Maybe there is one out there, but I couldn't find it.

Also, it's understandable. Since, it's only offline, unlike Fightcade. Who's lonely enough to play a multiplayer fighting game like `3S` on an emulator made for speedrunning and `TAS`ing old Nintendo games? (yes, me ._.)

Anyways, long story short, I had to migrate `3rd_training_lua` for `BizHawk` but I wanted to completely re-write/refactor it, because I felt it was a bit unorganized for my liking, I also wanted to personalize it to my taste.

My goal was to **create a compatible Training mode for BizHawk and FBNeo (Fightcade)** with all the functionality I want. And to add as many gauges as possible (`juggle meter`, `frame meter`, `charge meter`, character-specific `meter`s like `Gigas breaker (720) meter`, etc)

## Troubleshooting

*Coming soon* after I reach `v1.0.0`

## Contribution

I appreciate all the help!

Althought, for the time being, I would not accept Pull Requests until *after* I finish writing the basic flow and logic of the project.

Feel free to open an [Issue] in case of a Bug, a Request, a Suggestion or an Inquiry.

## Changelog

### v0.0.2 (05/04/2026)

* Tested on Fightcade. It Works!
* Finalized the final structured.
* Added `input_history` display, for both players.

### v0.0.1 (28/04/2026)

* Made the Repository
* Added the [README]
* Added `juggle_meter` as a proof of concept.

## Roadmap

[Old Trello Roadmap][Trello] to be updated.

## License

**MIT** License for the win!

## References

*I will add all of them evently. I am just Lazy™*

[BizHawk]: https://tasvideos.org/BizHawk
[Fightcade]: https://www.fightcade.com
[Archive]: https://github.com/MizoPro/traiiin3s/archive/main.zip
[Release]: https://github.com/MizoPro/traiiin3s/releases/latest
[Grouflon Training Mode]: https://github.com/Grouflon/3rd_training_lua
[GBVSR Frame Meter]: https://github.com/agersant/gbvsr-frame-meter
[Issue]: https://github.com/MizoPro/traiiin3s/issues/new/choose
[README]: https://github.com/MizoPro/traiiin3s/blob/main/README.md
[Trello]: https://trello.com/b/DEuoeagk/project-traiiin3s
