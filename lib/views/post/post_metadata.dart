part of 'post.dart';

class PostMetadata extends StatelessWidget {
  const PostMetadata({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final post = PostHolder.of(context)!.post;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
            ((post.commentCount != 0 ? 1 : 0) + (post.sharedCount != 0 ? 1 : 0))
                    .isEven
                ? 5
                : 1, ((index) {
          if (index == 2) {
            return const Icon(
              Icons.circle,
              size: 4,
            );
          }
          if (post.sharedCount != 0 && index == 0) {
            return Text('${post.sharedCount} paylaşım');
          } else if (post.commentCount != 0 && index.isEven) {
            return Text('${post.commentCount} yorum');
          }
          return SizedBox(
            width: 4,
          );
        }))
      ],
    );
  }
}







/*

  Merhabalar Ali bey, 

  Ege Üniversitesi Sağlık,Kültür ve Spo Daire Başkanlığı'na vereceğimiz dilekçe için gerekli olan tc,cv ve etkinlik afişinde kullanılacak olan fotoğraf için kalan zamanımız azalmakta. Müsait bir zamanınızda Bu bilgileri benimle paylaşmanızı rica ediyorum 
  Saygılarımla. 


 */
