# 24 hours challenge: project 1

This is one of my own challenges: every project is limited to be done within `24 hours`

## What is this demo included

- how to consume API data
- how to use Bootstrap strategy to pre-load data before showing home page for better user experience
- Redux like single source of state
- How efficient to create UI building block via SwiftUI


--------------

## Redux like single source state

Choose https://github.com/Dimillian/SwiftUIFlux because it fits:

- scale/module capability like https://vuex.vuejs.org/guide/modules.html

I also have my own implementation of similar way under the folder of `Redux (Deprecated)`

The bad part of single source state is potential diff performance (similar here: https://nalexn.github.io/swiftui-observableobject/), this happens especially on big projects. In this case, my suggestion is to use multiple stores (communications between them then will be a challenge)

## How to convert model objects( pure classes/structs ) to and from JSON

`Moya` builtin supports data model mapping, and fits my requirement, so I don't need any additional framework

https://github.com/SwiftyJSON/SwiftyJSON does not support data model mapping, but is still very good since we don't need to worry about `Optional Wrapping thing`. I include it into my project for debugging facilitation.
