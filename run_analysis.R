# Загружаем необходимые библиотеки
library(dplyr)

# Загружаем тренировочные и тестовые данные
train_data <- read.table("UCI HAR Dataset/train/X_train.txt")
test_data <- read.table("UCI HAR Dataset/test/X_test.txt")

# Загружаем метки активности для тренировочных и тестовых данных
train_labels <- read.table("UCI HAR Dataset/train/y_train.txt")
test_labels <- read.table("UCI HAR Dataset/test/y_test.txt")

# Загружаем данные о субъектах для тренировочных и тестовых данных
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Загружаем имена признаков и метки активности
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# Объединяем данные
all_data <- rbind(train_data, test_data)
all_labels <- rbind(train_labels, test_labels)
all_subjects <- rbind(train_subjects, test_subjects)

# Присваиваем имена столбцам с помощью данных из features.txt
colnames(all_data) <- features$V2

# Извлекаем только столбцы, связанные с mean и std
selected_columns <- grep("mean\\(\\)|std\\(\\)", features$V2)
all_data <- all_data[, selected_columns]

# Присваиваем текстовые метки активности
all_labels$V1 <- factor(all_labels$V1, levels = 1:6, labels = activity_labels$V2)
colnames(all_labels) <- "Activity"

# Присваиваем имя для столбца с субъектами
colnames(all_subjects) <- "Subject"

# Объединяем все данные в один набор
tidy_data <- cbind(all_subjects, all_labels, all_data)

# Создаём второй набор данных с усреднёнными значениями
tidy_data_avg <- tidy_data %>%
  group_by(Subject, Activity) %>%
  summarise_all(list(mean = ~mean(.)))

# Сохраняем итоговый набор данных в файл
write.table(tidy_data_avg, "tidy_data_avg.txt", row.names = FALSE)
