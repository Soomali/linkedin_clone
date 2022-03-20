part of 'conversation_models.dart';

const _userNames = [
  '+90 552 875 64 48',
  'CS teknik mobil',
  'Mehmet Ali',
  'Alen',
  'Kader',
  'Kader',
  'Büşra Ece',
  'Hüseyin',
  'Merve',
  'Yusuf',
  'Ata',
  'Burak',
  'Betül',
  'Kadir',
  'Damla',
  'Uğur Alp',
];

const _photoUrls = [
  'https://firebasestorage.googleapis.com/v0/b/pati-1c0a4.appspot.com/o/AnimalPhotos%2FV2rWd5uJ93ghmMnyvJXQ3aGd4223-5FqUF3NNxbpbPDhoizRz-113000000?alt=media&token=c427c221-a6b5-4023-98c6-04427195fc64',
  'https://firebasestorage.googleapis.com/v0/b/pati-1c0a4.appspot.com/o/AnimalPhotos%2FV2rWd5uJ93ghmMnyvJXQ3aGd4223-6kxI1nA0QWFEj1a4Y92q-148000000?alt=media&token=80386643-7430-457a-bfdb-19bdbc983543',
  'https://firebasestorage.googleapis.com/v0/b/pati-1c0a4.appspot.com/o/AnimalPhotos%2FV2rWd5uJ93ghmMnyvJXQ3aGd4223-IBBm5oa1pWBKIGqQ5Hog-105000000?alt=media&token=2ef576cc-86d0-464b-9d79-991a2dc7ca53',
  'https://firebasestorage.googleapis.com/v0/b/pati-1c0a4.appspot.com/o/AnimalPhotos%2FV2rWd5uJ93ghmMnyvJXQ3aGd4223-Sal6Uwu42j5ScDNtqDS0-487000000?alt=media&token=2761356c-91be-4d2c-8f99-d1e4467c0d35',
  'https://firebasestorage.googleapis.com/v0/b/pati-1c0a4.appspot.com/o/AnimalPhotos%2FV2rWd5uJ93ghmMnyvJXQ3aGd4223-V71y0RHNtrDHfzdofi1s-923000000?alt=media&token=93c864f6-c136-49c6-b21e-021dbc314da4',
  'https://firebasestorage.googleapis.com/v0/b/pati-1c0a4.appspot.com/o/AnimalPhotos%2FV2rWd5uJ93ghmMnyvJXQ3aGd4223-dhjtwxAPGnBTl0Rmm3Ax-940000000?alt=media&token=8602d330-a401-48d9-beae-1e1dbfae0a26',
  'https://firebasestorage.googleapis.com/v0/b/pati-1c0a4.appspot.com/o/AnimalPhotos%2FV2rWd5uJ93ghmMnyvJXQ3aGd4223-mnQZ4YuyU8mPEChKLCCD-408000000?alt=media&token=d881c042-5ef1-4673-a3f2-ec27134248ab',
  'https://firebasestorage.googleapis.com/v0/b/pati-1c0a4.appspot.com/o/AnimalPhotos%2FV2rWd5uJ93ghmMnyvJXQ3aGd4223-nmDbFhe7sldoUKM4l3ti-172000000?alt=media&token=cc71d52b-e3a4-41f2-bc90-a77c9e0e53c6',
  'https://firebasestorage.googleapis.com/v0/b/pati-1c0a4.appspot.com/o/AnimalPhotos%2FV2rWd5uJ93ghmMnyvJXQ3aGd4223-pmzXIGgh6u5Ul8wJrRDM-461000000?alt=media&token=88332226-73be-4038-8111-8a8fa28ace05',
  'https://firebasestorage.googleapis.com/v0/b/pati-1c0a4.appspot.com/o/AnimalPhotos%2FV2rWd5uJ93ghmMnyvJXQ3aGd4223-rY9KHAeZRhisy2RErQUW-558000000?alt=media&token=799681cb-76bf-439b-8e60-740f127a1bde',
  'https://firebasestorage.googleapis.com/v0/b/pati-1c0a4.appspot.com/o/AnimalPhotos%2FV2rWd5uJ93ghmMnyvJXQ3aGd4223-vYmvwkg6eI96sX8qXH0N-198000000?alt=media&token=e8b77bfc-3ec8-4571-9526-390550029443',
  'https://firebasestorage.googleapis.com/v0/b/pati-1c0a4.appspot.com/o/AnimalPhotos%2FZvykuekSqoZt3580r94Wdq1jrdz2-arKqPB70C4WteNrAHh5K-763000000?alt=media&token=2923c7fe-a6f7-4cbe-a985-a7a1ee352823'
];

class User {
  final String name;
  final String photoUrl;
  User({required this.name, required this.photoUrl});
  User copyWith({String? name, String? photoUrl}) =>
      User(name: name ?? this.name, photoUrl: photoUrl ?? this.photoUrl);
  User.random()
      : name = _userNames[_random.nextInt(_userNames.length)],
        photoUrl = _photoUrls[_random.nextInt(_photoUrls.length)];
}
