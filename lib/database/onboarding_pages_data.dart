class OnboardingPagesData {
  final String image;
  final String title;
  final String text;

  OnboardingPagesData({required this.image, required this.title, required this.text});
  
}

List<OnboardingPagesData> onboardingPagesList = [
  OnboardingPagesData(image: 'assets/images/person_using_laptop.png', title: 'Бронирование без \nголовной боли', text: 'С нашим приложением бронирование стало \nмаксимально простым'),
  OnboardingPagesData(image: 'assets/images/woman_yoga.png', title: 'Уникальные впечатления \nждут вас', text: 'Откройте для себя необычные и \nуникальные места для проживания'),
  OnboardingPagesData(image: 'assets/images/women_using_phone.png', title: 'Почувствуйте себя \nкак дома', text: 'Наше приложение поможет вам найти \nне просто жилье, а настоящий дом'),

  
];