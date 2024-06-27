
CREATE TABLE `sms_attendance` (
  `attendance_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `attendance_status` int(11) NOT NULL,
  `attendance_date` date NOT NULL,
  PRIMARY KEY (`attendance_id`),
  KEY `fk_attendance_student` (`student_id`),
  KEY `fk_attendance_class` (`class_id`),
  KEY `fk_attendance_section` (`section_id`),
  CONSTRAINT `fk_attendance_student` FOREIGN KEY (`student_id`) REFERENCES `sms_students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_attendance_class` FOREIGN KEY (`class_id`) REFERENCES `sms_classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_attendance_section` FOREIGN KEY (`section_id`) REFERENCES `sms_section` (`section_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_attendance`
--

INSERT INTO `sms_attendance` (`attendance_id`, `student_id`, `class_id`, `section_id`, `attendance_status`, `attendance_date`) VALUES
(1, 6, 2, 1, 1, '2019/06/22'),
(2, 5, 2, 1, 4, '2019/06/22'),
(3, 3, 2, 1, 3, '2019/06/22'),
(4, 7, 4, 4, 3, '2019/06/22'),
(5, 6, 2, 1, 1, '2023/01/01'),
(6, 6, 2, 1, 1, '2023/01/02'),
(7, 5, 2, 1, 1, '2023/01/02'),
(8, 3, 2, 1, 3, '2023/01/02');

-- --------------------------------------------------------

--
-- Table structure for table `sms_classes`
--

CREATE TABLE `sms_classes` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `section` varchar(255) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_class_teacher` (`teacher_id`),
  CONSTRAINT `fk_class_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `sms_teacher` (`teacher_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_classes`
--

INSERT INTO `sms_classes` (`id`, `name`, `section`, `teacher_id`) VALUES
(2, 'class1', '1', 1),
(3, 'class2', '4', 3),
(4, 'class3', '2', 2),
(5, 'vbvcncvn', '2', 1),
(6, 'sffsafas', '2', 2);

-- --------------------------------------------------------

--
-- Table structure for table `sms_section`
--
CREATE TABLE `sms_section` (
  `section_id` int(11) NOT NULL AUTO_INCREMENT,
  `section` varchar(255) NOT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_section`
--

INSERT INTO `sms_section` (`section_id`, `section`) VALUES
(1, 'A'),
(2, 'B'),
(4, 'C'),
(5, 'dgdsgsdgsd bbb');

-- --------------------------------------------------------

--
-- Table structure for table `sms_students`
--

CREATE TABLE `sms_students` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `gender` varchar(40) NOT NULL,
  `dob` date NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `mobile` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `current_address` varchar(255) DEFAULT NULL,
  `permanent_address` varchar(255) DEFAULT NULL,
  `father_name` varchar(255) NOT NULL,
  `father_mobile` bigint(20) UNSIGNED NOT NULL,
  `father_occupation` varchar(255) NOT NULL,
  `mother_name` varchar(255) NOT NULL,
  `mother_mobile` bigint(20) UNSIGNED NOT NULL,
  `admission_no` int(11) NOT NULL,
  `roll_no` int(11) NOT NULL,
  `class` int(10) UNSIGNED NOT NULL,
  `section` int(11) NOT NULL,
  `stream` int(10) UNSIGNED DEFAULT NULL,
  `hostel` int(10) UNSIGNED DEFAULT NULL,
  `admission_date` date NOT NULL,
  `category` int(10) UNSIGNED DEFAULT NULL,
  `academic_year` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_student_class_section` (`class`, `section`),
  CONSTRAINT `fk_student_class` FOREIGN KEY (`class`) REFERENCES `sms_classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_student_section` FOREIGN KEY (`section`) REFERENCES `sms_section` (`section_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_students`
--

INSERT INTO `sms_students` (`id`, `name`, `gender`, `dob`, `photo`, `mobile`, `email`, `current_address`, `permanent_address`, `father_name`, `father_mobile`, `father_occupation`, `mother_name`, `mother_mobile`, `admission_no`, `roll_no`, `class`, `section`, `stream`, `hostel`, `admission_date`, `category`, `academic_year`) VALUES
(3, 'Smith', 'male', '0000-00-00', '1559480265cat-2083492_960_720.jpg', 123456789, 'smith@test.com', 'xyxz', NULL, 'jhone smith', 0, '', 'Diana smith', 0, 1234567, 654378, 2, 1, NULL, NULL, '0000-00-00', NULL, 2019),
(4, 'jaeeme khan', 'male', '22/06/1992', '1559480508phpzag.gif', 123456789, 'jaeeme@test.com', 'New delhi india', NULL, '', 0, '', '', 0, 12345678, 67891, 3, 2, NULL, NULL, '02/06/2019', NULL, 2019),
(5, 'Root', 'male', '22/06/1992', '1560685652password reset with php.png', 0, 'root@gmail.com', '', NULL, '', 0, '', '', 0, 123456789, 3532552, 2, 1, NULL, NULL, '02/06/2019', NULL, 2019),
(6, 'William', 'male', '22/06/1994', '1560686427cat-2083492_960_720.jpg', 0, 'william@test.com', '', NULL, '', 0, '', '', 0, 2147483647, 2147483647, 2, 1, NULL, NULL, '16/06/2019', NULL, 2019),
(7, 'Stokes', 'male', '22/06/1996', '1560687168cat-2083492_960_720.jpg', 0, 'stokes@test.com', '', NULL, '', 0, '', '', 0, 553252525, 1234554363, 4, 4, NULL, NULL, '16/06/2019', NULL, 2019);

-- --------------------------------------------------------

--
-- Table structure for table `sms_subjects`
--

CREATE TABLE `sms_subjects` (
  `subject_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `code` int(11) NOT NULL,
  PRIMARY KEY (`subject_id`),
  UNIQUE KEY `unique_subject_code` (`subject`, `code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Dumping data for table `sms_subjects`
--

INSERT INTO `sms_subjects` (`subject_id`, `subject`, `type`, `code`) VALUES
(1, 'English', 'Theory', 210),
(2, 'Mathmatics', 'Theory', 220),
(3, 'Drawing', 'Practical', 230),
(5, 'szfsfasfasf mmm', 'Theory', 53534);

-- --------------------------------------------------------

--
-- Table structure for table `sms_teacher`
--

CREATE TABLE `sms_teacher` (
  `teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher` varchar(255) NOT NULL,
  `subject_id` int(11) NOT NULL,
  PRIMARY KEY (`teacher_id`),
  KEY `fk_teacher_subject` (`subject_id`),
  CONSTRAINT `fk_teacher_subject` FOREIGN KEY (`subject_id`) REFERENCES `sms_subjects` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sms_teacher`
--

INSERT INTO `sms_teacher` (`teacher_id`, `teacher`, `subject_id`) VALUES
(1, 'Daniel', 1),
(2, 'George', 2),
(3, 'Mohan', 3),
(5, 'David', 0),
(6, 'sfsafas bbbb nn', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sms_user`
--
CREATE TABLE `sms_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `designation` varchar(50) NOT NULL,
  `image` varchar(250) NOT NULL,
  `type` varchar(250) NOT NULL DEFAULT 'general',
  `status` enum('active','pending','deleted') NOT NULL DEFAULT 'pending',
  `authtoken` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Dumping data for table `sms_user`
--

INSERT INTO `sms_user` (`id`, `first_name`, `last_name`, `email`, `password`, `gender`, `mobile`, `designation`, `image`, `type`, `status`, `authtoken`) VALUES
(1, 'web', 'damn', 'admin@webdamn.com', '123', 'male', '123456789', 'Web developer', '', 'administrator', 'active', '');


COMMIT;

