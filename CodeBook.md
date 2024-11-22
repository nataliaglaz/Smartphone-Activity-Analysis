# CodeBook

## Данные
В данном наборе данных содержатся записи об активности субъектов, собранные с помощью акселерометров на смартфоне Samsung Galaxy S.

## Переменные

1. **Subject**: Идентификатор субъекта, выполняющего активность.
2. **Activity**: Название активности, которую выполняет субъект (например, WALKING, RUNNING и т.д.).
3. **tBodyAcc-mean-X**: Среднее значение для оси X ускорения тела.
4. **tBodyAcc-mean-Y**: Среднее значение для оси Y ускорения тела.
5. **tBodyAcc-mean-Z**: Среднее значение для оси Z ускорения тела.
6. **tBodyAcc-std-X**: Стандартное отклонение для оси X ускорения тела.
7. **tBodyAcc-std-Y**: Стандартное отклонение для оси Y ускорения тела.
8. И так далее для всех признаков.

## Описание трансформаций
- Столбцы были отфильтрованы так, чтобы оставить только те, которые содержат информацию о среднем значении и стандартном отклонении (mean, std).
- Активности были переименованы с числовых значений в описательные текстовые названия.
- Данные были усреднены для каждого субъекта и активности.