//
//  Action.swift
//  SummerPracticeiOS2021
//
//  Created by Alina Bikkinina on 09.07.2021.
//

enum ActionType: String {
    case sharing = "рекомендует Вам посмотреть фильм"
    case haveWatched = "посмотрел фильм"
}

struct Action {
    var friend: User
    var film: Film
    var actionType: ActionType
}
