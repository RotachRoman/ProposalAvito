# ProposalAvito
Что сделано:  
Реализован экран в соответствии с примером макета(кроме динамической высоты ячеек)
Отступы, шрифты сделаны на глаз по картине.
Сделано с Unit Tests.
Данные для экрана парсятся из json файла.

Логика взаимодействия:  
Элементы на сером фоне из примера и кнопка "Выбрать" кликабельные, крестик нет. 
При нажатии на элемент он выделяется (отмечается синей галочкой) или отменяется. 
Одновременно может быть отмечен только один элемент. 
При нажатии кнопки выбора показывается алерт с названием выбранной услуги. 

Не используются внешние зависимости, SwiftUI и Storyboard.

В проекте используется UICollectionView.

Архитектуру Viper начал изучать(для стажировки на авито)

Добавил ветку Hotfix.

Данный проект не соответствует SOLID принципам
