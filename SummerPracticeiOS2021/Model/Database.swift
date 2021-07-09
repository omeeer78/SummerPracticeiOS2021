//
//  Database.swift
//  SummerPracticeiOS2021
//
//  Created by itisioslab on 05.07.2021.
//

import UIKit

class Database {
    
    init() {
        presentUser = users[0]
        addFriends()
        addChecklist()
        addActions()
    }
    
    var actions: [User : [Action]] = [:]
    
    var presentUser: User
    
    var users: [User] = [User(name: "unterlantas", image: #imageLiteral(resourceName: "drag"), favoriteGenre: Genre.thriller, password: "123", friends: [], checklist: []),
                         User(name: "Andrewoch", image: UIImage(named: "durov") ?? UIImage(), favoriteGenre: Genre.horror, password: "432", friends: [], checklist: []),
                         User(name: "zikibikk", image: UIImage(named: "rapuncel") ?? UIImage(), favoriteGenre: Genre.drama, password: "543", friends: [], checklist: []),
                         User(name: "peachysangria", image: UIImage(named: "grey") ?? UIImage(), favoriteGenre: Genre.comedy, password: "600", friends: [], checklist: []),
                         User(name: "etozhealsu", image: UIImage(named: "buster") ?? UIImage(), favoriteGenre: Genre.action, password: "641", friends: [], checklist: []),
                         User(name: "Chakski", image: UIImage(named: "vigvam") ?? UIImage(), favoriteGenre: Genre.comedy, password: "043", friends: [], checklist: []),
                         User(name: "etoalsu", image: UIImage(named: "chelka") ?? UIImage(), favoriteGenre: Genre.comedy, password: "232", friends: [], checklist: []),
                         User(name: "kemal645", image: UIImage(named: "papich") ?? UIImage(), favoriteGenre: Genre.action, password: "000", friends: [], checklist: []),
                         User(name: "devilish_smile", image: UIImage(named: "pink") ?? UIImage(), favoriteGenre: Genre.drama, password: "666", friends: [], checklist: []),
                         User(name: "primetime11", image: UIImage(named: "guf") ?? UIImage(), favoriteGenre: Genre.thriller, password: "111", friends: [], checklist: [])]
    var films: [Film] = [Film(title: "Побег из Шоушенка", director: "Фрэнк Дарабонт", annotation: "Выдающаяся драма о силе таланта, важности дружбы,                       стремлении к свободе и Рите Хэйворт", image: UIImage(named: "Shawshenk") ?? UIImage(), rating: 8.9, genre: Genre.drama),
                         Film(title: "Чёрная роза", director: "Александр Невский", annotation: "Майор московской полиции отправляется в Лос-Анджелес для помощи в расследовании серии убийств русских эмигрантов.", image: UIImage(named: "black rose") ?? UIImage(), rating: 1.5, genre: Genre.action),
                         Film(title: "Интерстеллар", director: "Кристофер Нолан", annotation: "Фантастический эпос про задыхающуюся Землю, космические полеты и парадоксы времени.", image: UIImage(named: "interstellar") ?? UIImage(), rating: 8.6, genre: Genre.drama),
                         Film(title: "Мстители", director: "Джосс Уидон", annotation: "Команда супергероев дает отпор скандинавскому богу Локи. Начало фантастической саги в киновселенной Marvel.", image: UIImage(named: "avengers") ?? UIImage(), rating: 7.9, genre: Genre.action),
                         Film(title: "Лига Справедливости Зака Снайдера", director: "Зак Снайдер", annotation: "Бэтмен собирает команду супергероев, чтобы спасти Землю.", image: UIImage(named: "justice") ?? UIImage(), rating: 8.0, genre: Genre.action),
                         Film(title: "Блондинка в шоколаде", director: "Уильям Хейнс", annotation: "Уроки сладкой жизни от Перис Хилтон.", image: UIImage(named: "blonde") ?? UIImage(), rating: 1.6, genre: Genre.comedy),
                         Film(title: "Оно", director: "Андрес Мускетти", annotation: "Злобный клоун терроризирует подростков. Адаптация романа-хоррора Стивена Кинга о детских страхах.", image: UIImage(named: "it") ?? UIImage(), rating: 7.3, genre: Genre.horror),
                         Film(title: "Джокер", director: "Тодд Филлипс", annotation: "Как неудачливый комик стал самым опасным человеком в Готэме. Бенефис Хоакина Феникса и «Оскар» за саундтрек.", image: UIImage(named: "joker") ?? UIImage(), rating: 8.0, genre: Genre.thriller),
                         Film(title: "Большая ржака", director: "Виталий Москаленко", annotation: "Это больше чем комедия! Это - «Большая Ржака»!", image: UIImage(named: "big lol") ?? UIImage(), rating: 1.4, genre: Genre.comedy),
                         Film(title: "Достать ножи", director: "Райан Джонсон", annotation: "Остроумный детектив в духе Агаты Кристи, населенный нетипичными персонажами и вывернутый наизнанку", image: UIImage(named: "knives out") ?? UIImage(), rating: 8.0, genre: Genre.thriller),
                         Film(title: "Горбатая гора", director: "Энг Ли", annotation: "Хит Леджер и Джейк Джилленхол пытаются любить вопреки судьбе. Драма Энга Ли, получившая три «Оскара».", image: UIImage(named: "mountain") ?? UIImage(), rating: 7.5, genre: Genre.drama),
                         Film(title: "Супернова", director: "Гарри Макквин", annotation: "Сэм и Таскер отправляются в последнее совместное путешествие. Колин Ферт и Стэнли Туччи в пронзительной драме.", image: UIImage(named: "supernova") ?? UIImage(), rating: 6.5, genre: Genre.drama),
                         Film(title: "Легок на помине", director: "Евгений Абызов", annotation: "Молодому и успешному риелтору Павлу необходимо получить доверенность на куплю-продажу старинного поместья. А для этого втереться в доверие к владелице, одинокой старушке.", image: UIImage(named: "easy") ?? UIImage(), rating: 4.9, genre: Genre.comedy),
                         Film(title: "Цветок дьявола", director: "Екатерина Гроховская", annotation: "Студентке Полине снится загадочный цветок на воротах средневекового замка, не перестающий манить и преследовать её наяву.", image: UIImage(named: "flower") ?? UIImage(), rating: 1.4, genre: Genre.horror),
                         Film(title: "Бабушка лёгкого поведения", director: "Марюс Вайсберг", annotation: "Аферист перевоплощается в бабушку, скрываясь от бандитов. Фарсовая комедия с Александром Реввой и Глюкозой.", image: UIImage(named: "babushka") ?? UIImage(), rating: 5.1, genre: Genre.comedy),
                         Film(title: "Нападение гигантского нечёткого пальца", director: "Коуди Кларк", annotation: "Гигантский нечёткий палец прямиком из космоса спускается на Землю и начинает преследовать молодую женщину.", image: UIImage(named: "finger") ?? UIImage(), rating: 10.0, genre: Genre.horror),
                         Film(title: "Майор Гром: Чумной Доктор", director: "Олег Трофим", annotation: "Честный полицейский ловит мстителя в маске, убивающего коррупционеров. Супергеройское кино по комиксу Bubble.", image: UIImage(named: "grom") ?? UIImage(), rating: 7.2, genre: Genre.action),
                         Film(title: "Борат 2: Подарок от бескультурной обезьяны вице-премьеру Майклу Пенсу в пользу недавно уменьшившейся нации Казахстана", director: "Джейсон Уолинер", annotation: "По мнению президента Казахстана 14 лет назад журналист Борат Сагдиев опозорил родину на весь мир, и влиятельные державы теперь не воспринимают его страну всерьёз", image: UIImage(named: "borat") ?? UIImage(), rating: 6.3, genre: Genre.comedy),
                         Film(title: "Губка Боб в Бегах", director: "Тим Хилл", annotation: "Гэри, лучший друг Губки Боба, пропал. Поэтому, Губка Боб и Патрик отправляются далеко за пределы Бикини Боттома, чтобы спасти своего друга в розовой раковине.", image: UIImage(named: "sponge") ?? UIImage(), rating: 6.1, genre: Genre.comedy),
                         Film(title: "Довод", director: "Кристофер Нолан", annotation: "Протагонист пытается обезвредить террориста с помощью уникальной технологии. Блокбастер-пазл Кристофера Нолана", image: UIImage(named: "tenet") ?? UIImage(), rating: 7.6, genre: Genre.action),
                         Film(title: "Мальчишник в Вегасе", director: "Тодд Филлипс", annotation: "Друзья решили оторваться в городе грехов — и у них получилось. ", image: UIImage(named: "hangover") ?? UIImage(), rating: 7.9, genre: Genre.comedy),
                         Film(title: "С широко закрытыми глазами", director: "Стэнли Кубрик", annotation: "Супруги Кидман и Круз блуждают в эротическом кошмаре по Фрейду. Последний и самый загадочный фильм Кубрика", image: UIImage(named: "eyes") ?? UIImage(), rating: 7.5, genre: Genre.thriller),
                         Film(title: "Ла-Ла-Лэнд", director: "Дэмьен Шазелл", annotation: "Любовь, музыка и поющий Райан Гослинг", image: UIImage(named: "lala") ?? UIImage(), rating: 7.9, genre: Genre.drama),
                         Film(title: "Доктор Стрэндж", director: "Скотт Дерриксон", annotation: "После автокатастрофы хирург становится верховным защитником Земли. В роли супергероя — Бенедикт Камбербэтч.", image: UIImage(named: "strange") ?? UIImage(), rating: 7.5, genre: Genre.action),
                         Film(title: "Дурак", director: "Юрий Быков", annotation: "Герой спешит предупредить людей о скором обрушении жилого здания, но беда не приходит одна.", image: UIImage(named: "durak") ?? UIImage(), rating: 8.1, genre: Genre.drama),
                         Film(title: "Шоу Трумана", director: "Питер Уир", annotation: "Благополучный страховой агент обнаруживает, что он — герой реалити-шоу. Джим Керри в пророческой антиутопии.", image: UIImage(named: "truman") ?? UIImage(), rating: 8.3, genre: Genre.drama),
                         Film(title: "Шрэк", director: "Эндрю Адамсон", annotation: "Огр-мизантроп спасает принцессу, чтобы вернуть свое болото. Революционная анимация о том, что красота — внутри.", image: UIImage(named: "shrek") ?? UIImage(), rating: 8.0, genre: Genre.comedy),
                         Film(title: "Дрейк и Джош в Голливуде", director: "Дэн Шнайдер", annotation: "Незадачливые братишки Дрейк и Джош снова вляпались в историю.", image: UIImage(named: "drake") ?? UIImage(), rating: 7.3, genre: Genre.comedy),
                         Film(title: "Первому игроку приготовиться", director: "Стивен Спилберг", annotation: "Подростки гоняются за «пасхалками» в компьютерной игре, которая заменила всем реальность", image: UIImage(named: "ready") ?? UIImage(), rating: 7.4, genre: Genre.action),
                         Film(title: "Три биллборда на границе Эбинга, Миссури", director: "Мартин МакДона", annotation: "Потеряв дочь, героиня пытается достучаться до шерифа с помощью наружной рекламы. «Оскар» за женскую роль.", image: UIImage(named: "billboards") ?? UIImage(), rating: 8.2, genre: Genre.drama),
                         Film(title: "Непосредственно Каха!", director: "Виктор Шамиров", annotation: "Крутой и ещё крутее", image: UIImage(named: "kaha") ?? UIImage(), rating: 3.8, genre: Genre.comedy),
                         Film(title: "Мстители: Война бесконечности", director: "Энтони Руссо", annotation: "Предпоследний фильм о суперкоманде Marvel. Титан Танос вынашивает страшный план — угрозу всей Вселенной.", image: UIImage(named: "infinity war") ?? UIImage(), rating: 7.9, genre: Genre.action),
                         Film(title: "Омерзительная восьмёрка", director: "Квентин Тарантино", annotation: "Снег и несколько ублюдков на Диком Западе. Эффектная сатира на американские ценности от Квентина Тарантино.", image: UIImage(named: "hateful") ?? UIImage(), rating: 7.9, genre: Genre.thriller),
                         Film(title: "Волк с Уолл-Стрит", director: "Мартин Скорсезе", annotation: "Восхождение циника-гедониста на бизнес-олимп 1980-х. Блистательный тандем Леонардо ДиКаприо и Мартина Скорсезе.", image: UIImage(named: "wolf") ?? UIImage(), rating: 8.1, genre: Genre.comedy),
                         Film(title: "Однажды в Голливуде", director: "Квентин Тарантино", annotation: "Можно ли переписать историю? Самый ностальгический фильм Тарантино — с Шэрон Тейт, Брюсом Ли и Чарли Мэнсоном.", image: UIImage(named: "hollywood") ?? UIImage(), rating: 8.0, genre: Genre.action),
                         Film(title: "007: Не время умирать", director: "Кэри Дзёдзи Фуканага", annotation: "Бонд попадает в ловушку к таинственному злодею, вооруженному опасным технологическим оружием.", image: UIImage(named: "no time") ?? UIImage(), rating: 7.5, genre: Genre.action)]
    
    func addFriends() {
        presentUser.friends = [users[1], users[2], users[3], users[4], users[5], users[6], users[7], users[8], users[9]]
    }
    
    func addChecklist() {
        presentUser.checklist = [ChecklistCellModel(film: films[0], addingDate: Date(), status: Status.wantToWatch),
                              ChecklistCellModel(film: films[5], addingDate: Date(), status: Status.completed),
                              ChecklistCellModel(film: films[3], addingDate: Date(), status: Status.wantToWatch)]
        
    }
    
    func addActions() {
        actions[presentUser] = [(Action(friend: users[1], film: films[2], actionType: ActionType.haveWatched)),
                                (Action(friend: users[2], film: films[4], actionType: ActionType.sharing)),
                                (Action(friend: users[3], film: films[6], actionType: ActionType.sharing)),
                                (Action(friend: users[4], film: films[9], actionType: ActionType.sharing))]
    }
    func updateFilmCheckListStatus(film: Film, newStatus:Status){
            
            guard let index = users[0].checklist.firstIndex(where: { $0.film.title == film.title }) else {
                
                let newChecklistModel = ChecklistCellModel(film: film, addingDate: Date(), status: newStatus)
                users[0].checklist.append(newChecklistModel)
                return }
            let newChecklistModel = ChecklistCellModel(film: film, addingDate: users[0].checklist[index].addingDate, status: newStatus)
            users[0].checklist[index] = newChecklistModel
        }
}

var data = Database()
