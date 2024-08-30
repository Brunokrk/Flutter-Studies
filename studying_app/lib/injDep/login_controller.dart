class LoginController {
  final SignInRepository injectedSignInRepository;
  final AccountRepository injectedAccountRepository;
  final MiscellaneousRepository injectedMiscellaneousRepository;
  final IFacialAuthRepository injectFacialAuthRepository;

  LoginController({
    required this.injectedSignInRepository,
    required this.injectedAccountRepository,
    required this.injectedMiscellaneousRepository,
    required this.injectFacialAuthRepository,
  });


  //Subst do .obs() e Rx...
  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ValueNotifier<bool> buttonEnabled = ValueNotifier(false);
  final ValueNotifier<bool> buttonEntrarEnabled = ValueNotifier(false);
  final ValueNotifier<bool> tokenExists = ValueNotifier(false);
  final ValueNotifier<String> appVersion = ValueNotifier('...');
  final ValueNotifier<bool> isKeyboardVisible = ValueNotifier(false);
  final ValueNotifier<bool> isResetPassword = ValueNotifier(false);
  final ValueNotifier<bool> passwordResetSent = ValueNotifier(false);
  final ValueNotifier<String> operatorMail = ValueNotifier('');
  //Não sei --> late RxList<ChallengeKey> keys


}