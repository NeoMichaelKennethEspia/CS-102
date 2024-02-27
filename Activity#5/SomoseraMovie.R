library(dplyr)
library(dbplyr)
library(RMariaDB)

connection <- dbConnect(RMariaDB::MariaDB(),
                        dsn="mysql",
                        Server = "localhost",
                        dbname = "moviedata_somosera",
                        user = "root",
                        password = '')
dbListTables(connection)

dbListFields(connection,"data")
movtitle_dta <- dbGetQuery(connection, "SELECT * FROM moviedata_somosera.data")
glimpse(movtitle_dta)

movtitle_dta[c(1:10),]
tail(movtitle_dta)

movtitle_data <- dbGetQuery(connection, "SELECT MovieTitle FROM moviedata_somosera.data")
movtitle_data[c(1:10),]

queryone <- "INSERT INTO data (MovieTitle, Reviewer, DateOfReview, Rating, TitleOfTheReview, Review) VALUES ('Ready or Not','ThomDerd', '5 January 2020', '8/10', 'It will keep your eyes on screen!','Grace is about to marry the youngest member of the very wealthy Le Domas family. But theres something sinister going on with this family... Well, the movies central idea is not that new but the delivery of the idea, the pace and the performance of Samara Weaving really elevate this film. Entertaining and tense with comical moments that fit the genre, will make you follow almost all the characters in the film. Also kudos to the slow costume transformation of the bride and the juxtaposition of the prior wedding shots with what happens after, as this helps create a sense of relatability with Grace. One of the entertaining movies of 2019.8/10.')"
query_result <- dbSendQuery(connection, queryone)
dbClearResult(query_result)

querytwo <- "INSERT INTO data (MovieTitle, Reviewer, DateOfReview, Rating, TitleOfTheReview, Review) VALUES ('Happy Death Day','Sleepin_Dragon', '23 September 2019', '7/10', 'Definitely way better then I had expected.','Jessica Rothe shines through in this tongue in cheek horror. Its a film that doesnt take itself too seriously, the characters, means of death, and outlandish humour move it into the horror comedy genre. I loved the reference to Groundhog Day at the end of the film, I would imagine there was some sort of in joke there, and of course any film that involves the loop storyline will have reference to the great Bill Murray film. There were some great twists and turns, the best one coming at the end. This was very enjoyable. 7/10')"
query_result <- dbSendQuery(connection, querytwo)
dbClearResult(query_result)

querythree <- "INSERT INTO data (MovieTitle, Reviewer, DateOfReview, Rating, TitleOfTheReview, Review) VALUES ('Escape Room','rustonreviews', '9 February 2019', '7/10', 'A fun little thriller.','Drawing influences from Saw (2004), Final Destination (2000), and Cube (1997), Escape Room follows six individuals, all of whom receive a puzzle box prescribing a cryptic note inviting them to the Minos Escape Room Facility. Lured to the facility under the promise of receiving a cash prize of ten thousand dollars, these six strangers must endure several intricately designed puzzle rooms in a thrilling game of life or death. While the premise doesnt exactly scream originality, Escape Room is a perfectly enjoyable little thriller. For those expecting buckets of gore and sickening death scenes, look elsewhere, as Schut and Melniks screenplay is much more attuned to focusing on the elaborate puzzles themselves, resulting in a film that intrigues rather than disturbs. Pace wise, the film doesnt slow down and is engaging throughout, some of the puzzle rooms are quite visually arresting, and thankfully the characters arent just one dimensional zeroes either. While the ending does border on nonsensical, Escape Room is a still a fun film that is definitely worth checking out.')"
query_result <- dbSendQuery(connection, querythree)
dbClearResult(query_result)

queryfour <- "INSERT INTO data (MovieTitle, Reviewer, DateOfReview, Rating, TitleOfTheReview, Review) VALUES ('Spider-Man: No Way Home','Gordon-11', '15 December 2021', '10/10', 'Loved every second','This Spiderman is really fantastic. It captivated me right from the start, and I was entranced every second. Theres adventure, friendship, team spirit, love, empathy, and brotherhood. The people in the cinema clapped and cheered multiple times, at the appearance of key characters and at big hint of what the future holds for Spiderman. I loved every second of it!')"
query_result <- dbSendQuery(connection, queryfour)
dbClearResult(query_result)

queryfive <- "INSERT INTO data (MovieTitle, Reviewer, DateOfReview, Rating, TitleOfTheReview, Review) VALUES ('Avengers: Infinity War','RJBrez', '24 January 2021', '10/10', 'Best movie of the MCU, incredible from start to finish.','Infinity War is remembered mostly for how it ends, with good reason. But for me, the entire movie is incredible. Action, humor, cinematography, heartbreak, etc. It was a culmination of 10 years of character development. The benefit of that hard work? The movie can start with incredible action and never let up. Most wouldnt agree because of the ending, but I feel its the best movie of the MCU (so far). Endgame was awesome, infinity war was better. I think the best part of it was the fact that we had so many cool character meet ups that as fans we never thought wed see. Thor with the guardians? Wow. Star Lord and Iron Man? Rocket and the winter soldier? We could go on and on. They also mastered the art of humor to help offset some deep deep hurt throughout the story. Thor and Star Lords interactions are pure gold. Thor calling Rocket rabbit pure gold. Dr Strange and Tony going toe to toe is worth the price of admission as well. Im going to stop now or I could type forever.My only goal of writing this review is to help sway some others. Try to appreciate this movie for more than the gut wrenching ending. Its nonstop awesome from beginning to end. Enjoy!')"
query_result <- dbSendQuery(connection, queryfive)
dbClearResult(query_result)

querysix <- "INSERT INTO data (MovieTitle, Reviewer, DateOfReview, Rating, TitleOfTheReview, Review) VALUES ('The Hunger Games: The Ballad of Songbirds & Snakes','kevin_robbins', '20 November 2023', '5/10', 'This installment is the weakest in the series and a significant letdown','My wife and I watched The Hunger Games: The Ballad of Songbirds and Snakes (2023) in theaters last night. The hunger games are struggling to maintain viewer interest so they decide to undergo rule changes, challenging mentors to guide their tributes to success. Young Coriolanus Snow believes he has a winning plot with a talented singer from the 12th district... Directed by Francis Lawrence (The Hunger Games: Catching Fire) and featuring Rachel Zegler (West Side Story), Tom Blyth (Billy the Kid), Viola Davis (The Help), Hunter Schafer (Euphoria), and Peter Dinklage (Game of Thrones). Regrettably, this installment is the weakest in the series and a significant letdown. Despite potential in the writing, Viola Davis delivers a stellar performance, while Rachel Zeglers acting feels rigid and unnatural, lacking authenticity. The writing falls short with average songs, dragging scenes, and a reliance on CGI, particularly in the water bottle and building collapse scenes, which appear cheesy and ridiculous. On the positive side, the villain shines, and the unpredictable evolution of Snow is outstanding. The final scene in the woods, however, disappoints after a brilliantly set-up sequence. The absolute final scene almost redeems the film by closing the premise perfectly. In conclusion, its best not to continue with any more Hunger Games films. This one falls flat. I would give it a 5/10 and only recommend it to diehard fans unafraid of potential disappointment.')"
query_result <- dbSendQuery(connection, querysix)
dbClearResult(query_result)

queryseven <- "INSERT INTO data (MovieTitle, Reviewer, DateOfReview, Rating, TitleOfTheReview, Review) VALUES ('Split','evanston_dad', '7 August 2017', '7/10', 'Movie Overall Could Have Been So Much Better, But McAvoy is Astounding','James McAvoy gives what could have potentially been an award-worthy performance if it had appeared in a different film. He plays a man with multiple personalities who kidnaps three young girls as a part of a plot two of the personalities have hatched to unleash a powerful and unstoppable identity. Betty Buckley, in a better performance than the role necessarily needed, plays a therapist working with him and who begins to unravel the alarming plot. Writer/director M. Night Shyamalan, who hasnt made a movie Ive wanted to see since Signs, crafts a nifty and effective thriller with three fourths of his film, and then sort of if not completely ruins it by taking his idea too far and pushing the supernatural elements to the point where we realize were not even watching the same kind of movie we were at the beginning. This particular story, and especially McAvoys performance, would have been compelling enough without Shyamalans characteristic inability to understand when hes ruining his own premise. Grade: B)"
query_result <- dbSendQuery(connection, queryseven)
dbClearResult(query_result)

dbDisconnect(connection)
