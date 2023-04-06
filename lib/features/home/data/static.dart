import 'models/news_model.dart';

const String _disc =
    "As a tech department, we're usually pretty good at spotting tech that's out of the ordinary. During time trials we're used to seeing new aero innovation, and while there are certainly aero tricks used in road stages, they are harder to spot. A case in point, throughout the Volta ao Algarve, Alexander Kristoff has been wearing an old discontinued time trial helmet. Nisi enim voluptate irure laborum. Voluptate sit esse sit non non aute aute mollit sint quis irure id adipisicing. Eiusmod consequat sit id magna eu mollit. Veniam consectetur sint esse velit. Adipisicing non non mollit ut laborum aute irure. Nulla laboris quis occaecat ad ad amet tempor sint nostrud occaecat do do. Enim consectetur nulla fugiat aliquip non Lorem mollit voluptate. Reprehenderit tempor ut et ea velit pariatur eiusmod enim fugiat magna ea ullamco non ex. Veniam officia in consectetur ut magna sint qui dolor dolor magna laborum minim mollit culpa.";

// List<RecModel> recNewsList = [
//   RecModel(
//     title:
//         'Is education only for the young? What do people learn when they are older?',
//     authorName: 'PrintDiscuss',
//     image:
//         'https://img.freepik.com/free-photo/business-women-signature-document_1388-90.jpg?w=740&t=st=1679951966~exp=1679952566~hmac=d61c9f95f282d13b34bbb57db3704ba6ef6080ed8cd79cf0b9bab56393c13ada',
//     authorImage:
//         'https://img.freepik.com/free-vector/learning-concept-illustration_114360-6186.jpg?w=740&t=st=1679952008~exp=1679952608~hmac=ccfdf62ea1339cc67094127c4d1493cce74ae91ff1911df270a927f62e4deac2',
//     date: 'Mar 27,2023',
//     category: 'Education',
//   ),
//   RecModel(
//     title: 'How do we get more energy from the sun?',
//     authorName: 'Guardian',
//     image:
//         'https://img.freepik.com/premium-photo/collection-medical-flasksscience-glass-flask-blue-chemistry-laboratoryconcept-medicine_666266-26.jpg?w=740',
//     authorImage:
//         'https://img.freepik.com/free-vector/scientists-holding-dna-molecules_52683-37535.jpg?w=740&t=st=1679952286~exp=1679952886~hmac=3efd9c0401f7e593b1d66ab2ad384a881c963b82b8eac1f7a7661f0859f49566',
//     date: 'Mar 28,2023',
//     category: 'Science',
//   ),
// ];

List<NewsModel> news = [
  NewsModel(
    id: 1,
    title: 'Alexander wears modified helmet in road races',
    status: 'Trending',
    description: _disc,
    authorName: 'CNN Indonesia',
    image:
        'https://img.freepik.com/free-photo/young-handsome-man-riding-motorbike-countryside-road_176420-2423.jpg?w=740&t=st=1679937731~exp=1679938331~hmac=25442dcff282fb2005d183cb9577bed6b9a041f0c45fd594a58a295de4725775',
    authorImage:
        'https://cutewallpaper.org/24/cnn-png/cnn-556cc-%E2%80%93-d1a8e-logos-b41cc-download.png',
    date: '6 hour',
    category: 'Sports',
    isRecommended: false,
  ),
  NewsModel(
    id: 2,
    title: 'World Bank is key to averting climate catastrophe',
    status: 'New',
    description: _disc,
    authorName: 'News Decoder',
    image:
        'https://news-decoder.com/wp-content/uploads/2023/03/World-Bank-Is-key-to-averting-climate-catastrophe-1280x720.jpeg',
    authorImage:
        'https://cutewallpaper.org/24/cnn-png/cnn-556cc-%E2%80%93-d1a8e-logos-b41cc-download.png',
    date: '2 minutes',
    category: 'science',
    isRecommended: false,
  ),
  NewsModel(
    id: 3,
    title: 'Alexander wears modified helmet in road races',
    status: 'Trending',
    description: _disc,
    authorName: 'CNN Indonesia',
    image:
        'https://images.unsplash.com/photo-1540575467063-178a50c2df87?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    authorImage:
        'https://cutewallpaper.org/24/cnn-png/cnn-556cc-%E2%80%93-d1a8e-logos-b41cc-download.png',
    date: '3 hour',
    category: 'sports',
    isRecommended: false,
  ),
  NewsModel(
    id: 4,
    title: 'What Training Do Volleyball Players Need?',
    status: 'Trending',
    description: _disc,
    authorName: 'McKindney',
    image:
        'https://img.freepik.com/premium-photo/young-people-runner-running-running-road-city-park_41380-393.jpg?w=740',
    authorImage:
        'https://img.freepik.com/free-vector/basketball-player-with-ball-sportsman-vector-cartoon-illustration-muscular-man-cap-professional-athlete-sport-trainer-handsome-strong-guy-with-smile-isolated-orange-background_107791-8214.jpg?w=740&t=st=1679948753~exp=1679949353~hmac=612ebf85e60379613ad514ee11675275247e6af72c354afd2521d1903ab1c3ce',
    date: 'Feb 27,2023',
    category: 'sports',
    isRecommended: true,
  ),
];
