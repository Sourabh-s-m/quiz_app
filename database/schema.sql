CREATE TABLE topics (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE questions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    topic_id INT,
    question_text TEXT NOT NULL,
    level ENUM('beginner', 'intermediate', 'professional') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (topic_id) REFERENCES topics(id)
);

CREATE TABLE answers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    question_id INT,
    answer_text TEXT NOT NULL,
    is_correct BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

-- Reinsert topics
INSERT INTO topics (name) VALUES 
('PHP'),
('Sports'),
('Science & Technology'),
('Arts'),
('Politics');

-- Get topic IDs
SET @php_topic = 1;
SET @sports_topic = 2;
SET @science_topic = 3;
SET @arts_topic = 4;
SET @politics_topic = 5;

-- Insert 10 questions for PHP
INSERT INTO questions (topic_id, question_text, level) VALUES 
(@php_topic, 'What is the most popular PHP framework?', 'beginner'),
(@php_topic, 'How do you handle errors in PHP?', 'intermediate'),
(@php_topic, 'What is the difference between == and === in PHP?', 'beginner'),
(@php_topic, 'How do you implement authentication in PHP?', 'professional'),
(@php_topic, 'What is the use of the isset() function in PHP?', 'beginner'),
(@php_topic, 'How do you optimize the performance of a PHP application?', 'professional'),
(@php_topic, 'What is the difference between static and dynamic typing in PHP?', 'intermediate'),
(@php_topic, 'How do you handle file uploads in PHP?', 'intermediate'),
(@php_topic, 'What is the use of the die() function in PHP?', 'beginner'),
(@php_topic, 'How do you implement caching in PHP?', 'professional');

-- Insert 4 answers for each question
INSERT INTO answers (question_id, answer_text, is_correct) VALUES 
(1, 'Laravel', TRUE),
(1, 'CodeIgniter', FALSE),
(1, 'Symfony', FALSE),
(1, 'Zend Framework', FALSE),

(2, 'Using try-catch blocks', TRUE),
(2, 'Using error_reporting', FALSE),
(2, 'Using die()', FALSE),
(2, 'Using exit()', FALSE),

(3, '=== checks both value and type', TRUE),
(3, '== checks only value', FALSE),
(3, '=== checks only type', FALSE),
(3, '== checks both value and type', FALSE),

(4, 'Using sessions', TRUE),
(4, 'Using cookies', FALSE),
(4, 'Using JWT', FALSE),
(4, 'Using OAuth', FALSE),

(5, 'To check if a variable is set', TRUE),
(5, 'To check if a variable is not set', FALSE),
(5, 'To check if a variable is empty', FALSE),
(5, 'To check if a variable is not empty', FALSE),

(6, 'Optimizing database queries', TRUE),
(6, 'Using caching', FALSE),
(6, 'Using indexing', FALSE),
(6, 'Using normalization', FALSE),

(7, 'Static typing is explicit, dynamic is implicit', TRUE),
(7, 'Dynamic typing is explicit, static is implicit', FALSE),
(7, 'Static typing is implicit, dynamic is explicit', FALSE),
(7, 'Dynamic typing is implicit, static is explicit', FALSE),

(8, 'Using the $_FILES superglobal', TRUE),
(8, 'Using the $_POST superglobal', FALSE),
(8, 'Using the $_GET superglobal', FALSE),
(8, 'Using the $_REQUEST superglobal', FALSE),

(9, 'To stop script execution', TRUE),
(9, 'To continue script execution', FALSE),
(9, 'To pause script execution', FALSE),
(9, 'To resume script execution', FALSE),

(10, 'Using Memcached', TRUE),
(10, 'Using Redis', FALSE),
(10, 'Using APCu', FALSE),
(10, 'Using XCache', FALSE);

-- Insert 10 questions for Sports
INSERT INTO questions (topic_id, question_text, level) VALUES 
(@sports_topic, 'What is the most popular sport in the world?', 'beginner'),
(@sports_topic, 'How do you improve your running technique?', 'intermediate'),
(@sports_topic, 'What is the difference between a foul and a penalty in soccer?', 'beginner'),
(@sports_topic, 'How do you train for a marathon?', 'professional'),
(@sports_topic, 'What is the use of stretching exercises in sports?', 'beginner'),
(@sports_topic, 'How do you optimize your swimming technique?', 'professional'),
(@sports_topic, 'What is the difference between a sprint and a marathon?', 'intermediate'),
(@sports_topic, 'How do you handle injuries in sports?', 'intermediate'),
(@sports_topic, 'What is the use of warm-up exercises in sports?', 'beginner'),
(@sports_topic, 'How do you implement a strength training program?', 'professional');

-- Insert 4 answers for each question
INSERT INTO answers (question_id, answer_text, is_correct) VALUES 
(11, 'Soccer', TRUE),
(11, 'Basketball', FALSE),
(11, 'Tennis', FALSE),
(11, 'Volleyball', FALSE),

(12, 'By focusing on proper posture', TRUE),
(12, 'By increasing your stride length', FALSE),
(12, 'By running on a treadmill', FALSE),
(12, 'By running barefoot', FALSE),

(13, 'A foul is a minor infraction, a penalty is a major one', TRUE),
(13, 'A foul is a major infraction, a penalty is a minor one', FALSE),
(13, 'A foul is given for unsportsmanlike conduct, a penalty for a technical foul', FALSE),
(13, 'A foul is given for a technical foul, a penalty for unsportsmanlike conduct', FALSE),

(14, 'By gradually increasing your mileage', TRUE),
(14, 'By running as fast as you can', FALSE),
(14, 'By running on hills', FALSE),
(14, 'By running on a track', FALSE),

(15, 'To prevent injuries', TRUE),
(15, 'To improve performance', FALSE),
(15, 'To reduce fatigue', FALSE),
(15, 'To increase endurance', FALSE),

(16, 'By focusing on your kick', TRUE),
(16, 'By focusing on your arm movement', FALSE),
(16, 'By focusing on your breathing', FALSE),
(16, 'By focusing on your body position', FALSE),

(17, 'A sprint is a short race, a marathon is a long one', TRUE),
(17, 'A sprint is a long race, a marathon is a short one', FALSE),
(17, 'A sprint is a team event, a marathon is an individual event', FALSE),
(17, 'A sprint is an individual event, a marathon is a team event', FALSE),

(18, 'By seeking medical attention', TRUE),
(18, 'By ignoring the injury', FALSE),
(18, 'By applying ice', FALSE),
(18, 'By taking painkillers', FALSE),

(19, 'To prepare your muscles for exercise', TRUE),
(19, 'To cool down after exercise', FALSE),
(19, 'To improve your flexibility', FALSE),
(19, 'To increase your strength', FALSE),

(20, 'By creating a workout plan', TRUE),
(20, 'By lifting heavy weights', FALSE),
(20, 'By doing cardio exercises', FALSE),
(20, 'By eating a high-protein diet', FALSE);

-- Insert 10 questions for Science & Technology
INSERT INTO questions (topic_id, question_text, level) VALUES 
(@science_topic, 'What is the basic unit of life?', 'beginner'),
(@science_topic, 'What is the speed of light?', 'intermediate'),
(@science_topic, 'What is the chemical formula for water?', 'beginner'),
(@science_topic, 'What is Newton\'s second law of motion?', 'professional'),
(@science_topic, 'What is the process of photosynthesis?', 'beginner'),
(@science_topic, 'What is the theory of relativity?', 'professional'),
(@science_topic, 'What is the difference between an atom and a molecule?', 'intermediate'),
(@science_topic, 'What is the function of DNA?', 'intermediate'),
(@science_topic, 'What is the law of conservation of mass?', 'beginner'),
(@science_topic, 'What is the role of enzymes in biological reactions?', 'professional');

-- Insert 4 answers for each question
INSERT INTO answers (question_id, answer_text, is_correct) VALUES 
(21, 'Cell', TRUE),
(21, 'Atom', FALSE),
(21, 'Molecule', FALSE),
(21, 'Tissue', FALSE),

(22, '299,792,458 meters per second', TRUE),
(22, '150,000 kilometers per second', FALSE),
(22, '300,000 kilometers per second', FALSE),
(22, '1,000,000 kilometers per second', FALSE),

(23, 'H2O', TRUE),
(23, 'CO2', FALSE),
(23, 'O2', FALSE),
(23, 'NaCl', FALSE),

(24, 'Force equals mass times acceleration', TRUE),
(24, 'Energy equals mass times velocity', FALSE),
(24, 'Force equals mass divided by acceleration', FALSE),
(24, 'Acceleration equals force divided by mass', FALSE),

(25, 'Plants convert sunlight into energy', TRUE),
(25, 'Plants absorb carbon dioxide', FALSE),
(25, 'Plants release oxygen', FALSE),
(25, 'Plants grow in the dark', FALSE),

(26, 'A theory explaining gravity and space-time', TRUE),
(26, 'A theory about atomic structure', FALSE),
(26, 'A theory about chemical reactions', FALSE),
(26, 'A theory about evolution', FALSE),

(27, 'An atom is the smallest unit of matter, a molecule is a group of atoms', TRUE),
(27, 'An atom is a group of molecules', FALSE),
(27, 'A molecule is the smallest unit of matter', FALSE),
(27, 'Atoms are larger than molecules', FALSE),

(28, 'It carries genetic information', TRUE),
(28, 'It provides energy', FALSE),
(28, 'It helps in digestion', FALSE),
(28, 'It is a type of protein', FALSE),

(29, 'Mass cannot be created or destroyed', TRUE),
(29, 'Mass can be created', FALSE),
(29, 'Mass can be destroyed', FALSE),
(29, 'Mass is constant', FALSE),

(30, 'They speed up chemical reactions', TRUE),
(30, 'They slow down chemical reactions', FALSE),
(30, 'They are not involved in reactions', FALSE),
(30, 'They change the products of reactions', FALSE);

-- Insert 10 questions for Arts
INSERT INTO questions (topic_id, question_text, level) VALUES 
(@arts_topic, 'Who painted the Mona Lisa?', 'beginner'),
(@arts_topic, 'What is the main purpose of art?', 'intermediate'),
(@arts_topic, 'What are the primary colors?', 'beginner'),
(@arts_topic, 'What is the difference between realism and impressionism?', 'professional'),
(@arts_topic, 'What is a sonnet?', 'beginner'),
(@arts_topic, 'Who is known as the father of modern art?', 'professional'),
(@arts_topic, 'What is the significance of the color wheel?', 'intermediate'),
(@arts_topic, 'What is abstract art?', 'intermediate'),
(@arts_topic, 'What is the role of a curator?', 'beginner'),
(@arts_topic, 'What is the difference between sculpture and painting?', 'professional');

-- Insert 4 answers for each question
INSERT INTO answers (question_id, answer_text, is_correct) VALUES 
(31, 'Leonardo da Vinci', TRUE),
(31, 'Vincent van Gogh', FALSE),
(31, 'Pablo Picasso', FALSE),
(31, 'Claude Monet', FALSE),

(32, 'To express emotions', TRUE),
(32, 'To make money', FALSE),
(32, 'To follow trends', FALSE),
(32, 'To entertain', FALSE),

(33, 'Red, blue, yellow', TRUE),
(33, 'Green, orange, purple', FALSE),
(33, 'Black, white, gray', FALSE),
(33, 'Pink, brown, teal', FALSE),

(34, 'Realism depicts life as it is, impressionism captures the moment', TRUE),
(34, 'Realism is abstract, impressionism is realistic', FALSE),
(34, 'Realism is colorful, impressionism is dull', FALSE),
(34, 'Realism is modern, impressionism is classical', FALSE),

(35, 'A 14-line poem', TRUE),
(35, 'A type of painting', FALSE),
(35, 'A musical composition', FALSE),
(35, 'A dance form', FALSE),

(36, 'Pablo Picasso', TRUE),
(36, 'Vincent van Gogh', FALSE),
(36, 'Claude Monet', FALSE),
(36, 'Henri Matisse', FALSE),

(37, 'It helps in color mixing', TRUE),
(37, 'It is used for painting', FALSE),
(37, 'It is a type of sculpture', FALSE),
(37, 'It is a musical scale', FALSE),

(38, 'Art that does not represent reality', TRUE),
(38, 'Art that is realistic', FALSE),
(38, 'Art that is only in black and white', FALSE),
(38, 'Art that is made with clay', FALSE),

(39, 'To manage art collections', TRUE),
(39, 'To create art', FALSE),
(39, 'To sell art', FALSE),
(39, 'To critique art', FALSE),

(40, 'Sculpture is three-dimensional, painting is two-dimensional', TRUE),
(40, 'Sculpture is flat, painting is three-dimensional', FALSE),
(40, 'Sculpture is made of paint, painting is made of stone', FALSE),
(40, 'Sculpture is temporary, painting is permanent', FALSE);

-- Insert 10 questions for Politics
INSERT INTO questions (topic_id, question_text, level) VALUES 
(@politics_topic, 'What is the main purpose of government?', 'beginner'),
(@politics_topic, 'What is democracy?', 'intermediate'),
(@politics_topic, 'Who was the first President of the United States?', 'beginner'),
(@politics_topic, 'What is the separation of powers?', 'professional'),
(@politics_topic, 'What is a political party?', 'beginner'),
(@politics_topic, 'What is the Bill of Rights?', 'professional'),
(@politics_topic, 'What is the role of the judiciary?', 'intermediate'),
(@politics_topic, 'What is a constitution?', 'intermediate'),
(@politics_topic, 'What is the significance of voting?', 'beginner'),
(@politics_topic, 'What is the difference between a republic and a democracy?', 'professional');

-- Insert 4 answers for each question
INSERT INTO answers (question_id, answer_text, is_correct) VALUES 
(41, 'To maintain order and provide services', TRUE),
(41, 'To control the economy', FALSE),
(41, 'To promote religion', FALSE),
(41, 'To enforce laws', FALSE),

(42, 'A system of government by the whole population', TRUE),
(42, 'A type of monarchy', FALSE),
(42, 'A form of dictatorship', FALSE),
(42, 'A system of government by a single ruler', FALSE),

(43, 'George Washington', TRUE),
(43, 'Thomas Jefferson', FALSE),
(43, 'Abraham Lincoln', FALSE),
(43, 'John Adams', FALSE),

(44, 'The division of government responsibilities into distinct branches', TRUE),
(44, 'The process of electing officials', FALSE),
(44, 'The separation of church and state', FALSE),
(44, 'The establishment of political parties', FALSE),

(45, 'An organization that seeks to gain political power', TRUE),
(45, 'A group of citizens', FALSE),
(45, 'A type of government', FALSE),
(45, 'A form of protest', FALSE),

(46, 'The first ten amendments to the Constitution', TRUE),
(46, 'A declaration of independence', FALSE),
(46, 'A type of law', FALSE),
(46, 'A political party platform', FALSE),

(47, 'To interpret laws and administer justice', TRUE),
(47, 'To create laws', FALSE),
(47, 'To enforce laws', FALSE),
(47, 'To elect officials', FALSE),

(48, 'A document that outlines the fundamental principles of a government', TRUE),
(48, 'A type of law', FALSE),
(48, 'A political party', FALSE),
(48, 'A form of protest', FALSE),

(49, 'It allows citizens to express their opinions and influence government', TRUE),
(49, 'It is a waste of time', FALSE),
(49, 'It is only for the wealthy', FALSE),
(49, 'It is not important', FALSE),

(50, 'A republic is governed by elected representatives, while a democracy is governed by the majority', TRUE),
(50, 'A republic is a type of democracy', FALSE),
(50, 'A democracy has no laws', FALSE),
(50, 'A republic is ruled by a king', FALSE);


