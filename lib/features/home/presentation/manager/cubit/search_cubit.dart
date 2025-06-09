import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:my_visitor/core/models/city_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<void> fetchAndStoreCitiesInHive() async {
  final snapshot = await FirebaseFirestore.instance.collection('cities').get();
  final box = await Hive.openBox<CityModel>('cities');

  for (var doc in snapshot.docs) {
    final data = doc.data();
    final city = CityModel.fromJson(data);
    await box.put(city.name, city);
  }

  log('Data saved to Hive');
}

Future<List<CityModel>> getCitiesFromHive() async {
  final box = await Hive.openBox<CityModel>('cities');
  return box.values.toList();
}







Future<void> uploadDataToFirebase( ) async {
  final decoded = jsonDecode(dataaaaa);
  final governorates = decoded['governorates'];

  for (var city in governorates) {
    await FirebaseFirestore.instance.collection('cities').add(city);
  }

  log('Upload complete');
}








}


final dataaaaa=""" {
  "governorates": [
    {
      "name": "Giza",
      "description": "Giza Governorate is one of the governorates of the Arab Republic of Egypt, located on the western bank of the Nile River, opposite Cairo Governorate. It is considered one of the oldest and most important Egyptian governorates, combining both urban and rural characteristics, as well as ancient history and modern development.",
      "tourist_places": [
        "The Three Pyramids and the Sphinx",
        "The Saqqara area, which includes the Step Pyramid of Djoser",
        "Dahshur, which contains the Bent Pyramid and the Red Pyramid",
        "The Grand Egyptian Museum (awaiting full opening), which is the largest museum of Pharaonic antiquities in the world"
      ],
      "activities": [
        {
          "title": "camel riding",
          "description": "Enjoying the most beautiful things is fun, and the greatest fun is doing so at the pyramids. It is a wonderful and enjoyable sight. I recommend all my friends to ride camels at the pyramids.",
          "images": [
            "https://www.istockphoto.com/photo/young-tourist-in-cairo-egypt-gm531928802-94020681",
            "https://www.istockphoto.com/photo/egypt-cairo-asian-female-tourist-riding-camel-with-great-pyramid-of-giza-in-gm1495914049-518760377",
            "https://www.istockphoto.com/photo/young-female-tourist-riding-camel-in-the-egyptian-desert-and-visits-the-pyramids-in-gm2148601027-569765377",
            "https://www.pexels.com/photo/people-posing-on-camel-by-giza-pyramid-20226467/",
            "https://www.istockphoto.com/photo/tourist-family-riding-camels-in-a-vast-desert-landscape-under-a-clear-blue-sky-with-gm2195989311-614038159",
            "https://www.istockphoto.com/photo/egypt-cairo-asian-group-tourists-riding-camel-with-great-pyramid-of-giza-in-gm1495914177-518760388",
            "https://www.pexels.com/photo/camel-with-tourist-on-back-in-desert-4356143/"
          ],
          "location": {
            "latitude": 29.9792,
            "longitude": 31.1342
          }
        },
        {
          "title": "hourse riding",
          "description": "try new activities at the Giza Pyramids, including horseback riding, exploring the beautiful pyramids, and enjoying the fresh air and ancient Egyptian architecture.",
          "images": [
            "https://www.pexels.com/photo/woman-wearing-blue-long-sleeved-shirt-riding-brown-horse-2402916/",
            "https://www.istockphoto.com/photo/pyramid-of-mycerinus-gm172301446-4569571?utm_source=pexels&utm_medium=affiliate&utm_campaign=sponsored_photo&utm_content=adp_inline_media&utm_term=vacation",
            "https://images.app.goo.gl/cPkUe66TBdh5cczS9",
            "https://images.app.goo.gl/qvgkTjox8HjVsaaJ9"
          ],
          "location": {
            "latitude": 29.9792,
            "longitude": 31.1342
          }
        },
        {
          "title": "Horse-drawn carriage ride",
          "description": "A wonderful experience eagerly awaited by tourists from around the world, it is a perfect fit for their delightful vacation in Giza. The horse-drawn carriage ride through the city's various streets and squares is a popular activity that every tourist group visiting Giza participates in. Horse-drawn carriage rides transport them between the tourist attractions on the Nile Corniche and the various squares, and also connect them to homes and various streets.",
          "images": [
            "https://www.pexels.com/photo/clear-sky-over-pyramids-in-giza-11208768/",
            "https://www.pexels.com/photo/horse-drawn-carriage-at-giza-pyramid-complex-31667419/",
            "https://www.pexels.com/photo/horse-and-pyramid-in-giza-behind-19310839/",
            "https://www.pexels.com/photo/horse-drawn-carriage-at-giza-pyramid-complex-31667419/"
          ],
          "location": {
            "latitude": 29.9753,
            "longitude": 31.1376
          }
        }
      ]
    },
    {
      "name": "Aswan",
      "description": "Aswan is considered one of the prominent tourist cities in Egypt, having risen to international fame to become a key destination for tourists from various nationalities. What distinguishes Aswan from other tourist cities in Egypt is its rich cultural and touristic diversity. It is blessed with enchanting natural beauty and stunning landscapes, in addition to its ancient temples and a variety of tourist attractions such as the High Dam, the Botanical Garden, and heritage museums. Moreover, it is characterized by the Nubian nature and the unique Nubian folklore.",
      "tourist_places": [
        "Philae Temple",
        "Nubian Museum",
        "Aswan High Dam",
        "Aswan Botanical Island (also known as Kitchener's Island)",
        "Aga Khan Mausoleum",
        "Monastery of St. Simeon (Arabic: Deir Anba Simaan)"
      ],
      "activities": [
        {
          "title": "Sand therapy",
          "description": "The head of the Chamber of Tourism Companies in Aswan added that there is a center for physical therapy specializing in sand immersion located on Elephantine Island, staffed by a select group of the best doctors in this field. The center also features sauna and steam baths. Additionally, the Isis Island Resort is considered one of the best and largest therapeutic tourism resorts in Aswan. It offers immersion baths in both yellow and black sand, ensuring significant results in treating various illnesses. He added: \"Studies conducted by the resort confirmed that those who underwent yellow and black sand baths showed improved immune efficiency, regulated rheumatoid activity markers, and reduced erythrocyte sedimentation rates. The center has determined that a minimum treatment period of three weeks is required.\nHot Sand Therapy: The hot sands in Aswan are considered a natural treasure for treating many ailments, especially rheumatism and joint diseases. The body is buried in the hot sand for a specific period, which helps relieve pain and stiffness, and improves blood circulation.",
          "images": [
            "https://images.app.goo.gl/3TfhwTNe9wXZyNGx6",
            "https://images.app.goo.gl/hqk8w22X9dfYAT4m6",
            "https://images.app.goo.gl/nYHKf7ZguVKnBLHY6"
          ],
          "location": {
            "latitude": 24.0886,
            "longitude": 32.8872
          }
        },
        {
          "title": "boat ride on the nile",
          "description": "It is fun to ride a boat on the Nile and see the wonderful views of Egypt.",
          "images": [
            "https://images.app.goo.gl/uKRFuuUHJMbWVkym8",
            "https://images.app.goo.gl/wPYDmc2MAKtKjptD8",
            "https://images.app.goo.gl/3qZkhJJST8kDAqtf6"
          ],
          "location": {
            "latitude": 24.0908,
            "longitude": 32.8998
          }
        },
        {
          "title": "Visit the Botanical Gardens",
          "description": "The Botanical Island in Aswan, also known as the \"Botanical Garden\" or \"Kitchener's Island,\" is one of the most beautiful natural and tourist attractions in southern Egypt. The island is located in the middle of the Nile River near the city of Aswan and covers an area of about 17 acres.",
          "images": [
            "https://images.app.goo.gl/UYthPqiJPR3gdMzAA",
            "https://images.app.goo.gl/5LyjkEVXFstWdNu58",
            "https://images.app.goo.gl/gafFsYPPEcRmo1Zd6"
          ],
          "location": {
            "latitude": 24.0901,
            "longitude": 32.8917
          }
        },
        {
          "title": "Aswan Market",
          "description": "A wonderful place for shopping and buying spices, perfumes, Nubian products, and souvenirs.",
          "images": [
            "https://images.app.goo.gl/913n3XdoMAdWSJFcA",
            "https://images.app.goo.gl/5VNLTtw3gz9cZay77",
            "https://images.app.goo.gl/wN2cpqRRQQJPVVaS6"
          ],
          "location": {
            "latitude": 24.0906,
            "longitude": 32.8999
          }
        }
      ]
    },
    {
      "name": "Fayoum",
      "description": "Fayoum Governorate, a unique oasis in Egypt’s Western Desert, blends lush agriculture with stunning desert landscapes. Renowned for its natural reserves like Wadi El-Rayan, with its waterfalls and lakes, and Wadi Al-Hitan, a UNESCO site with ancient whale fossils, it’s a haven for adventure and nature lovers. The governorate offers thrilling activities such as desert safaris, sandboarding, and camping under starry skies. Its serene ambiance and rich history, including Pharaonic ruins, make Fayoum a captivating escape from urban life.",
      "tourist_places": [
        "Wadi El-Rayan Protected Area",
        "Wadi Al-Hitan Protected Area"
      ],
      "activities": [
        {
          "title": "Exploring Natural Sites",
          "description": "Wadi El-Rayan Protected Area: You can enjoy unique waterfalls in the heart of the desert, stunning lakes, sandboarding, boat rides, and birdwatching—especially during the winter season.\nWadi Al-Hitan Protected Area: A UNESCO World Heritage Site where you can see fossilized skeletons of whales that lived millions of years ago, along with a museum that illustrates the evolution of whales and climate change in the region.",
          "images": [
            "https://images.app.goo.gl/9VPneq7gg8J7FU3D8",
            "https://images.app.goo.gl/yGY8UL5G8jYeKBEV9",
            "https://images.app.goo.gl/U47c3h5QCTBGEzPz6",
            "https://images.app.goo.gl/Zs3SA1P8WpwVgEL9A",
            "https://images.app.goo.gl/sLTsxWXzraYBYcpX8",
            "https://images.app.goo.gl/cLe17qzZY7p3UYek6"
          ],
          "location": {
            "latitude": 29.2487,
            "longitude": 30.5832
          }
        },
        {
          "title": "Safari Trips",
          "description": "Explore the Western Desert and the areas surrounding Fayoum in 4x4 vehicles.",
          "images": [
            "https://images.app.goo.gl/CtMdHBbMnJwiF6M2A",
            "https://images.app.goo.gl/zf5iAhhtX5twj2S38",
            "https://images.app.goo.gl/Md52t7HZpb9TTfeA8"
          ],
          "location": {
            "latitude": 29.2725,
            "longitude": 30.6070
          }
        },
        {
          "title": "Desert Camping",
          "description": "If you're an adventure lover, you can enjoy an unforgettable camping experience in the Fayoum desert, especially in areas like Wadi El-Rayan or near Wadi Al-Hitan. You can take in the beauty of the starry night sky and the enchanting silence of the desert.",
          "images": [
            "https://images.app.goo.gl/q3CVMEwe9u3LR45R7",
            "https://images.app.goo.gl/niyzZC8BpEx8tnu27",
            "https://images.app.goo.gl/Nj9uruZaqEtpftLbA"
          ],
          "location": {
            "latitude": 29.2436,
            "longitude": 30.5638
          }
        },
        {
          "title": "sand skating",
          "description": "Enjoy sandboarding in Wadi El-Rayan, which is considered one of the best places to practice this sport in Fayoum.",
          "images": [
            "https://images.app.goo.gl/FeEGihS2a4UM2g8Y9",
            "https://images.app.goo.gl/jGYCzv54YJnnmLgW9",
            "https://images.app.goo.gl/3iKuei8YUYPcds197"
          ],
          "location": {
            "latitude": 29.2425,
            "longitude": 30.5660
          }
        }
      ]
    },
    {
      "name": "Luxor",
      "description": "the jewel of Upper Egypt, captivates with its timeless natural beauty and enchanting Nile. It holds within its banks unique historical treasures—from the towering temples of Karnak and Luxor in the east to the tombs of the Valley of the Kings and Queens and the majestic Temple of Hatshepsut in the west. Its monuments tell the stories of a great civilization, turning every corner into an open-air museum that fascinates the soul.",
      "tourist_places": [
        "Karnak Temple: The largest ancient religious complex in the world",
        "Luxor Temple: A beautiful temple located on the banks of the Nile",
        "Valley of the Kings: Home to the tombs of pharaohs, including the tomb of Tutankhamun",
        "Temple of Hatshepsut: Known for its unique architectural design",
        "Valley of the Queens: Contains the tombs of queens and princesses"
      ],
      "activities": [
        {
          "title": "Hot Air Balloon Rides",
          "description": "An unforgettable experience to see Luxor and its landmarks from above, especially at sunrise.",
          "images": [
            "https://images.app.goo.gl/f1P4341k8jkJr5kw9",
            "https://images.app.goo.gl/fh3WaCimBnMHYwTLA",
            "https://images.app.goo.gl/TCtiKtq8NoyEuu6T7"
          ],
          "location": {
            "latitude": 25.7000,
            "longitude": 32.6396
          }
        },
        {
          "title": "Corniche Street",
          "description": "Enjoy an evening walk along the Nile Corniche and have dinner at one of the riverside restaurants.",
          "images": [
            "https://images.app.goo.gl/CxL4PvKsTbCEFaTg7",
            "https://images.app.goo.gl/kUkzZqZGYZLNFPdw6",
            "https://images.app.goo.gl/7x5yF1zSDjr89Sdt6"
          ],
          "location": {
            "latitude": 25.6997,
            "longitude": 32.6398
          }
        },
        {
          "title": "Felucca Ride on the Nile",
          "description": "Relax and enjoy the timeless beauty of the Nile and the breathtaking scenery along its banks.",
          "images": [
            "https://images.app.goo.gl/46FsXReoFvtY5NeN9",
            "https://images.app.goo.gl/Z3PUMr6vXKMup8Pe6",
            "https://images.app.goo.gl/tiWYGp2mQFnurqCX8"
          ],
          "location": {
            "latitude": 25.7005,
            "longitude": 32.6400
          }
        },
        {
          "title": "Shopping in Local Markets",
          "description": "Stroll through traditional markets to buy souvenirs, gifts, and local products.",
          "images": [
            "https://images.app.goo.gl/QYZ38aJ6ovwYBxvy6",
            "https://images.app.goo.gl/EinZNmNbo6jiXUUAA"
          ],
          "location": {
            "latitude": 25.6989,
            "longitude": 32.6423
          }
        }
      ]
    },
    {
      "name": "Alexandria",
      "description": "What a magical city! Alexandria, the Bride of the Mediterranean, captivates with its beauty that blends the scent of history with the charm of the present. Its beaches stretch like shimmering pearls along the coast, with turquoise waters and golden sands inviting you to relax and bask in the warm sun. It is truly an unforgettable Egyptian gem.",
      "tourist_places": [
        "The New Bibliotheca Alexandrina",
        "Qaitbay Citadel",
        "Montazah Gardens",
        "Stanley Bridge",
        "The Roman Theater",
        "Pompey's Pillar",
        "Catacombs of Kom El Shoqafa",
        "Maamoura Beach and Miami Beach"
      ],
      "activities": [
        {
          "title": "Visiting Alexandria Corniche",
          "description": "Enjoy a walk along the long seaside promenade, breathe in the fresh air, and take in the stunning views. You can also relax at one of the many cafés or restaurants scattered along the Corniche.",
          "images": [
            "https://images.app.goo.gl/MFAZF82v7tuDaMyw8",
            "https://images.app.goo.gl/AydKZdGZKhrWaExW8",
            "https://images.app.goo.gl/NXHXoJ3HA2xWNBkg9"
          ],
          "location": {
            "latitude": 31.2001,
            "longitude": 29.9187
          }
        },
        {
          "title": "Yacht Trips",
          "description": "Take a delightful yacht cruise to enjoy the view of the city from the sea.",
          "images": [
            "https://images.app.goo.gl/1ZNWcPTvKvx6YCMF7",
            "https://images.app.goo.gl/rj3yEciD7asAmx1R6",
            "https://images.app.goo.gl/S4ZLBnJHVZDUNS5e8"
          ],
          "location": {
            "latitude": 31.1980,
            "longitude": 29.9020
          }
        }
      ]
    },
    {
      "name": "Cairo",
      "description": "What a vibrant city! Cairo is a captivating blend of ancient history and bustling modern life. You can wander among the towering pyramids and the majestic Sphinx in Giza, then immerse yourself in the vibrant atmosphere of traditional markets like Khan el-Khalili with its colorful sights and fragrant scents.\nIn Cairo, you'll find yourself surrounded by the treasures of ancient Egyptian civilization in the Egyptian Museum, while the streets pulse with the daily life of Egyptians. The Nile River flows through the heart of the city, giving it a special charm. It's truly a city that never sleeps, full of stories and tales in every corner.",
      "tourist_places": [
        "The Giza Pyramids and the Sphinx: Ancient wonders of the world you absolutely must see for yourself",
        "The Egyptian Museum: A treasure trove that tells the story of ancient Egypt",
        "Cairo Tower: Offers a stunning panoramic view of the entire city",
        "Khan El Khalili: A historic market full of stories, souvenirs, and charm",
        "Salahadin Citadel: A historic fortress overlooking the city, home to magnificent mosques",
        "Old Cairo (Coptic Cairo): Churches and monasteries that tell the history of Christianity in Egypt",
        "Al-Muizz Street: An architectural gem rich with mosques and historic gates",
        "Al-Azhar Mosque: A renowned religious and scholarly beacon",
        "Zamalek Island: An upscale district with beautiful hotels, restaurants, and gardens"
      ],
      "activities": [
        {
          "title": "Exploring Islamic Cairo",
          "description": "Al-Muizz Street: This street is like an open-air museum of Islamic architecture, featuring many historic mosques, schools, and palaces. You can stroll through it and admire the beauty of its historic buildings.\nKhan El Khalili: This traditional market is full of life and color, where you can buy souvenirs, handicrafts, spices, and perfumes. Don’t forget to sit at one of the traditional cafés to enjoy tea or coffee.\nSaladin Citadel: This fortress offers panoramic views of Cairo and houses several historical landmarks, including the Mosque of Muhammad Ali Pasha.\nAl-Azhar Mosque: One of the oldest and most renowned mosques in the Islamic world, known for its unique architecture and rich history.",
          "images": [
            "https://images.app.goo.gl/AUnuFzWMFQ4bPHPw8",
            "https://images.app.goo.gl/J3brioW3KJiZDCrm9",
            "https://images.app.goo.gl/y29aebCD8pwLq6i28",
            "https://images.app.goo.gl/R23oJ2QNshZLtofL6",
            "https://images.app.goo.gl/2YpodBJLZNXdnPeo6",
            "https://images.app.goo.gl/1FuLgqc5kVDQ1CHi7",
            "https://images.app.goo.gl/d94Tj4Bo8o95VDrm9",
            "https://images.app.goo.gl/1SYqC688c6754y7D9",
            "https://images.app.goo.gl/dN7GyQNfzF287Sgj7",
            "https://images.app.goo.gl/gAaWzkEWSEZoEDsU6",
            "https://images.app.goo.gl/c5QiT9paDQ5736wn8",
            "https://images.app.goo.gl/8XkP6pEVKcF1aRB49",
            "https://images.app.goo.gl/qXzGBnzecx7MFATy8",
            "https://images.app.goo.gl/xEkLa3M6wQzrzUGZ6",
            "https://images.app.goo.gl/VryroBhXUCRpiqzV6",
            "https://images.app.goo.gl/NfNugV7k8BkNrpT49"
          ],
          "location": {
            "latitude": 30.0478,
            "longitude": 31.2622
          }
        },
        {
          "title": "visiting Al-Azhar Park",
          "description": "This beautiful park offers a peaceful green oasis in the heart of Cairo, with stunning views of the old city.",
          "images": [
            "https://images.app.goo.gl/TaD6Q8CqSdsNJuxaA",
            "https://images.app.goo.gl/qqEw9wQK8oh4YapeA",
            "https://images.app.goo.gl/h4TgGNxM9LzG7fjP8",
            "https://images.app.goo.gl/emuSLtqYfWeLJGQ78"
          ],
          "location": {
            "latitude": 30.0406,
            "longitude": 31.2639
          }
        },
        {
          "title": "visiting Egyptian Opera House",
          "description": "Watch performances of opera, ballet, and classical music in this elegant cultural venue.",
          "images": [
            "https://images.app.goo.gl/WAPDP3z3UmQAJsgP9",
            "https://images.app.goo.gl/uq51puUdvuasktfM6",
            "https://images.app.goo.gl/bgT3iJDizxurZyUb7"
          ],
          "location": {
            "latitude": 30.0420,
            "longitude": 31.2240
          }
        },
        {
          "title": "The Nile River",
          "description": "A boat ride on the Nile is an unforgettable experience",
          "images": [
            "https://images.app.goo.gl/iAeot8i9iJqEVYEs8",
            "https://images.app.goo.gl/CdTPqJnxADGSgng47",
            "https://images.app.goo.gl/g5MQo4VA6X4JovdK7",
            "https://images.app.goo.gl/ppokKrun7ASm5Ctg6"
          ],
          "location": {
            "latitude": 30.0475,
            "longitude": 31.2298
          }
        }
      ]
    },
    {
      "name": "Marsa Alam",
      "description": "A Red Sea gem with breathtaking natural beauty, from majestic mountains to rich coral reefs. Its beaches are enchanting and diverse, with soft white sands, tranquil bays, and world-class diving sites. A haven for relaxation and adventure in a pristine environment.",
      "tourist_places": [
        "Meteor Lake",
        "Al-Qulaan area and the mangrove trees",
        "Port Ghalib",
        "Shrine of Sheikh Abu Al-Hassan Al-Shadhili"
      ],
      "activities": [
        {
          "title": "Scuba Diving and Snorkeling",
          "description": "Marsa Alam is a world-renowned diving destination, where the Red Sea is rich with stunning coral reefs, colorful fish, and diverse marine life.\nThere are many well-equipped diving centers for all levels, whether you're a beginner or a professional diver.\nThe most famous diving spots include: Abu Dabbab Reef, Zabargad Island, Elphinstone Reef, Wadi El Gemal, and more.",
          "images": [
            "https://images.app.goo.gl/uGGcj9MpV8guoGg36",
            "https://images.app.goo.gl/5b4MVihx7E5TPJTcA",
            "https://images.app.goo.gl/rWTStWtyP8P4yT6A7",
            "https://images.app.goo.gl/J1rGexBcRWsENUo6A"
          ],
          "location": {
            "latitude": 25.0667,
            "longitude": 34.9000
          }
        },
        {
          "title": "Visiting Wadi El Gemal Protectorate",
          "description": "It is considered one of the most beautiful nature reserves in Egypt, known for its environmental diversity that includes mountains, sand dunes, and pristine coastlines. You can go on safari tours and observe wildlife and rare birds.",
          "images": [
            "https://images.app.goo.gl/Kw5kLwGQnsgyqXvL6",
            "https://images.app.goo.gl/tDzK5VvezgsGJaUA8",
            "https://images.app.goo.gl/QucuJAWkWigDvS737",
            "https://images.app.goo.gl/vaMtWStyVb1K9oeL6"
          ],
          "location": {
            "latitude": 24.6667,
            "longitude": 35.0667
          }
        },
        {
          "title": "Seeing the mangrove trees in Wadi El-Qulaan",
          "description": "It is considered one of the distinctive natural sights in the area.",
          "images": [
            "https://images.app.goo.gl/wbYPatT5TqZNsxBj7",
            "https://images.app.goo.gl/PdrobG1DBnYai54p8",
            "https://images.app.goo.gl/gXowaoXVUmnarPPJ6"
          ],
          "location": {
            "latitude": 24.6833,
            "longitude": 35.0833
          }
        }
      ]
    }
  ]
}""";