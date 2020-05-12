<p align="center">
  <img alt="" src="./tefeta.logo.png">
</p>

## <a name='TOC'>🐼 Summary</a>

* [Run project](#run)
* [Rules](#rules)
* [Overview](#overview)
* [Story](#story)
* [Challenge](#challenge)
* [Bonus](#bonus)
* [Credits](#credits)

## <a name='run'>💻 Run project</a>

Project made using Dart ❤️. You have two possibilities to run it.

Before all, go to root of project.

#### With Dart installed on your computer

You can run it directly without build it, just execute: `dart bin/main.dart ./data/maps/rect.01.map`

You can also build it in binary and run it:

* `dart2native bin/main.dart -o build/app`
* `./build/app ./data/maps/rect.01.map`


#### Using Docker

If you don't want to install Dart, you can run it using Docker.

First, you have to build the image using: `docker build -t pp-tefeta .`

After, run it with: `docker run pp-tefeta ./data/maps/rect.01.map`


## <a name='rules'>🦊 Rules</a>

Hi, here are some rules to carry out this story oav;

* You **MUST** create a git repository named `pp-tefeta`
* You **MUST** create a file called `.author.json` with your fullname

```sh
~/ts-tefeta ❯❯❯ cat -e .author.json
{
  "fullname" : "John H. Conway"
}$
```

> Of course, you can talk about the subject with other developers, peer-learning is
> the key to be a better developer. Don't hesitate to ask questions or help people on slack.

> Don't forget, there is no useless question :-)

You **MUST** return the project on Monday May, 18 at 12:00 pm by sending an MP on slack with the link of your github repo.<br />

Your repository **MUST** contain the totality of your source files, but no useless files (node_modules, temp files, log files,...).

## <a name='overview'>🐱 Overview</a>

The purpose of this project is simple, you **MUST** create a binary or a script that take any textual map file that represent a labyrinth and you have to output the labyrinth with a trace of the labyrinth solution.

## <a name='story'>🐨 Story</a>

### = Prelude

As a programming pragmatic module, you **CAN** use the programming language you want/love.<br />
The only thing is that you must provide a **Dockerfile** that run your project ;)

### = Map

A mapfile is a simple ascii file that contain on the first line the dimension of the map and then the labyrinth.<br />
The number 1 refer to the **entry** and the number 2 to the **exit**

Example:
```sh
$ cat -e ./data/maps/rect.01.map
13x12$
*************$
*  **       1$
*     *******$
*        ****$
**          *$
*     **** **$
********** **$
*           *$
*    ********$
*        *  *$
********    *$
*********2***$
```

## <a name='challenge'>🦁 Challenge</a>

### = Algorithm

After you just solved the problem, you challenge is to have the best algorithm of you class !<br />

We'll check the times of your algo and you'll get points depending of your position ! :)

```sh
❯ /usr/bin/time ./tefeta.ts ./data/maps/rect.07.map              
...
0.31 real         0.03 user         0.25 sys
```

> The time will be calculate after Docker environment setup of course ;)

## <a name='bonus'>🦄 Bonus</a>

I know you love that, well you can in bulk:

* Handle not squared map like [this oval map](./data/maps/oval.01.map)
* Add any graphical version

## <a name='credits'>🐵 Credits</a>

Craft with :heart: in **Paris**.
