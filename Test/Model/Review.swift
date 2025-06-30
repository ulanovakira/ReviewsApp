/// Модель отзыва.
struct Review: Decodable {

    /// Текст отзыва.
    let text: String
    /// Время создания отзыва.
    let created: String
    /// Данные пользователя
    let first_name: String
    let last_name: String
    var nameSurname: String {
        get {
            "\(first_name) \(last_name)"
        }
    }
    /// Рейтинг
    let rating: Int

}
