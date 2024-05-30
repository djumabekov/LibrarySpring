-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 30 2024 г., 16:38
-- Версия сервера: 8.0.30
-- Версия PHP: 8.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `AndroidLibrary`
--

-- --------------------------------------------------------

--
-- Структура таблицы `books`
--

CREATE TABLE `books` (
  `id` int NOT NULL,
  `book_name` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `pages` int DEFAULT NULL,
  `photo_path` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `books`
--

INSERT INTO `books` (`id`, `book_name`, `link`, `pages`, `photo_path`, `title`) VALUES
(1, 'Босиком по пеплу', 'https://firebasestorage.googleapis.com/v0/b/library-31f76.appspot.com/o/pdf%2Fbosikom_po_peplu.pdf?alt=media&token=3f24dc86-61e3-49a4-b595-78aa4c499437', 354, 'https://firebasestorage.googleapis.com/v0/b/library-31f76.appspot.com/o/photo%2Fbosikom_po_peplu.jpg?alt=media&token=386b7f24-83ee-433b-b71b-805b32de8f18', 'Пепел'),
(2, 'Гарри Поттер', 'https://firebasestorage.googleapis.com/v0/b/library-31f76.appspot.com/o/pdf%2Fgarri_potter.pdf?alt=media&token=924d0c0e-94cd-4123-b761-6885499d8584', 644, 'https://firebasestorage.googleapis.com/v0/b/library-31f76.appspot.com/o/photo%2Fgarri_potter.jpg?alt=media&token=06df0284-3c25-4505-a554-5f641345d98e', 'Узник Азкабана'),
(3, 'Ходячий замок', 'https://firebasestorage.googleapis.com/v0/b/library-31f76.appspot.com/o/pdf%2Fhodyachi_zamok.pdf?alt=media&token=a6055017-eb0f-4f26-bdb4-66e0125c98b1', 453, 'https://firebasestorage.googleapis.com/v0/b/library-31f76.appspot.com/o/photo%2Fhodyachi_zamok.jpg?alt=media&token=a074c0f8-72b5-423b-9e37-4d62478bf066', 'История любви'),
(4, 'Комдив', 'https://firebasestorage.googleapis.com/v0/b/library-31f76.appspot.com/o/pdf%2Fkomdiv.pdf?alt=media&token=6c556e73-cba7-4441-9493-b0c8dec37b41', 278, 'https://firebasestorage.googleapis.com/v0/b/library-31f76.appspot.com/o/photo%2Fkomdiv.jpg?alt=media&token=0c8bed26-9159-42a4-ae41-a6a05c526e44', 'Служба'),
(5, 'Красная карма', 'https://firebasestorage.googleapis.com/v0/b/library-31f76.appspot.com/o/pdf%2Fkrasnaya_karma.pdf?alt=media&token=fa7df222-3ddd-46f0-8024-7af61e9986f5', 483, 'https://firebasestorage.googleapis.com/v0/b/library-31f76.appspot.com/o/photo%2Fkrasnaya_karma.jpg?alt=media&token=1de7717d-98d0-41d2-9e26-3a6f27002e6e', 'Возмездие'),
(6, 'Звездная карта', 'https://firebasestorage.googleapis.com/v0/b/library-31f76.appspot.com/o/pdf%2Fzvezdnaya_karta.pdf?alt=media&token=89aa3eb5-6b30-40cd-8f1a-8ba6a53c1fc8', 548, 'https://firebasestorage.googleapis.com/v0/b/library-31f76.appspot.com/o/photo%2Fzvezdnaya_karta.jpg?alt=media&token=fa4f9486-c785-41b5-9261-8e2e991d67c7', 'Космос');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `email`, `first_name`, `last_name`) VALUES
(1, 'arman@mail.ru', 'arman', 'arman'),
(2, 'aslan@mail.ru', 'aslan', 'aslan'),
(3, 'omar@mail.ru', 'omar', 'omar'),
(4, 'vasya@mail.ru', 'vasya', 'vasya');

-- --------------------------------------------------------

--
-- Структура таблицы `user_library`
--

CREATE TABLE `user_library` (
  `user_id` int NOT NULL,
  `book_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `user_library`
--

INSERT INTO `user_library` (`user_id`, `book_id`) VALUES
(1, 1),
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_library`
--
ALTER TABLE `user_library`
  ADD KEY `FKopmfmd5lyerujdfratxqp1nse` (`book_id`),
  ADD KEY `FKc0yldqsbglvvenxcqjuh39tvc` (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `books`
--
ALTER TABLE `books`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `user_library`
--
ALTER TABLE `user_library`
  ADD CONSTRAINT `FKc0yldqsbglvvenxcqjuh39tvc` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKopmfmd5lyerujdfratxqp1nse` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
