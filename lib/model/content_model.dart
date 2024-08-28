class UnboardingContent {
  String image;
  String title;
  String description;
  UnboardingContent({required this.image, required this.title, required this.description});
}
List<UnboardingContent> contents = [
  UnboardingContent(
    title: 'Explore medical topics',
    image: 'assets/images/doc1.webp',
    description: "listen to audio contents covering various medical adapted from textbooks",
  ),
  UnboardingContent(
    title: 'learn anytime anywhere',
    image: 'assets/images/doc2.jpeg',
    description: "Access audio content on the go and learn at your own pace",
  ),
  UnboardingContent(
    title: 'Stay Updated',
    image: 'assets/images/doc3.jpeg',
    description: "Receive the latest updates and new content regularly",
  ),
];