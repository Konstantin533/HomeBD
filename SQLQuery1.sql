USE Home;



CREATE TABLE Trainer(
Id INT PRIMARY KEY,
FirsteName NVARCHAR(20) UNIQUE NOT NULL,
LastName NVARCHAR(20) UNIQUE NOT NULL,
Age INT NOT NULL
)

CREATE TABLE Team(
Id INT PRIMARY KEY,
TrainerId INT NOT NULL,
NameTeam NVARCHAR(20) NOT NULL,
Country NVARCHAR(20) NOT NULL
FOREIGN KEY (TrainerId) REFERENCES Trainer(Id),
)
CREATE TABLE Player(
Id INT PRIMARY KEY,
TeamId INT,
FirsteName NVARCHAR(20) UNIQUE NOT NULL,
LastName NVARCHAR(20) UNIQUE NOT NULL,
Number INT NOT NULL,
Age INT NOT NULL
FOREIGN KEY (TeamId) REFERENCES Team(Id),
)


INSERT Player VALUES (1,1,'Сергей','Петров',20,19)                  
INSERT Player VALUES (2,1,'Александр','Сидоров',21,18)       
INSERT Player VALUES (3,1,'Дмитрий','Коновалов',19,18)       
INSERT Player VALUES (4,1,'Артем','Сидорович',22,21)         
INSERT Player VALUES (5,1,'Петр','Яков',43,20)               
INSERT Player VALUES (6,2,'Георгий','Андрехич',44,25)
INSERT Player VALUES (7,2,'Анатолий','Власов',77,27)
INSERT Player VALUES (8,2,'Алексей','Смирнов',17,18)
INSERT Player VALUES (9,2,'Степан','Меньшов',1,20)
INSERT Player VALUES (10,3,'Иван','Иванович',55,18)
INSERT Player VALUES (11,3,'Илья','Петрович',59,27)
INSERT Player VALUES (12,3,'Максим','Панасенко',16,18)
INSERT Player VALUES (13,3,'Ян','Мишешкович',97,23)
INSERT Player VALUES (14,4,'Жан','Дробович',99,24)
INSERT Player VALUES (15,4,'Константин','Дремович',3,20)
INSERT Player VALUES (16,4,'Даниил','Медведев',6,21)

INSERT Trainer VALUES (1,'Сергей','Орлов',45) 
INSERT Trainer VALUES (2,'Димтрий','Петров',51)
INSERT Trainer VALUES (3,'Артем','Власов',42)
INSERT Trainer VALUES (4,'Анатолий','Сидоров',47)
INSERT Trainer VALUES (5,'Николай','Жданов',43)

INSERT Team VALUES (1,1,'Спартак','Россия')
INSERT Team VALUES (2,1,'ЦСКА','Россия')
INSERT Team VALUES (3,2,'Динамо','Россия')
INSERT Team VALUES (4,3,'Торпедо','Россия')

CREATE TABLE GroupTeam(
Id INT PRIMARY KEY,
TeamIdA INT,
TeamIdB INT,
NameGroup NVARCHAR(20),
FOREIGN KEY(TeamIdA) REFERENCES Team(Id),
FOREIGN KEY(TeamIdB) REFERENCES Team(Id),
CHECK((TeamIdA != TeamIdB))
)

CREATE TABLE Schedule(
Id INT PRIMARY KEY,
GroupId INT,
Time DATE,
FOREIGN KEY (GroupId) REFERENCES GroupTeam(Id)
)

INSERT GroupTeam VALUES (1,1,2,'Игра')
INSERT GroupTeam VALUES (2,2,3,'Игра')
INSERT GroupTeam VALUES (3,3,4,'Игра')

INSERT Schedule VALUES (1,2,'2023-01-12')

