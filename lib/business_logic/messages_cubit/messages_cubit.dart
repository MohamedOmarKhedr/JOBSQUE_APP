import 'package:flutter_bloc/flutter_bloc.dart';
part 'messages_state.dart';

class MessagesCubit extends Cubit<MessagesState> {
  MessagesCubit() : super(MessagesInitial());

  static MessagesCubit get(context) => BlocProvider.of(context);

  List<Map<String, dynamic>> chatsData = [
    {
      'logo': 'assets/images/home_layout/Twitter Logo2.png',
      'compName': 'Twitter',
      'lastMessage': 'Here is the link: http://zoom.com/abcdeefg',
      'time': '12:39',
      'isRead':false
    },
    {
      'logo': 'assets/images/home_layout/Gojek Logo.png',
      'compName': 'Gojek Indonesia',
      'lastMessage': 'Let’s keep in touch.',
      'time': '12:39',
      'isRead':false
    },
    {
      'logo': 'assets/images/home_layout/Shoope Logo.png',
      'compName': 'Shoope',
      'lastMessage': 'Thank You David!',
      'time': '09:45',
      'isRead':true
    },
    {
      'logo': 'assets/images/home_layout/Dana Logo.png',
      'compName': 'Dana',
      'lastMessage': 'Thank you for your attention!',
      'time': 'Yesterday',
      'isRead':false
    },
    {
      'logo': 'assets/images/home_layout/Slack Logo.png',
      'compName': 'Slack',
      'lastMessage': 'You: I look forward to hearing from you',
      'time': '12/8',
      'isRead':true
    },
    {
      'logo': 'assets/images/home_layout/Facebook Logo.png',
      'compName': 'Facebook',
      'lastMessage': 'You: What about the interview stage?',
      'time': '12/8',
      'isRead':true
    },

  ];
  bool onlyUnreadChat = false;

}
