import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:university_app/views/settings/widgets/settings_widget.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/constructor_text_style.dart';
import '../../../consts/app_text_styles/settings_text_style.dart';
import '../../app/views/terms_read.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.lightGreyColor,
        title: const Text(
          'Atrás',
          style: ConstructorTextStyle.appBar,
        ),
        titleSpacing: -5,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset('assets/icons/leading.svg'),
        ),
      ),
      body: Container(
        color: AppColors.lightGreyColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: size.height * 0.12,
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.015),
                child: const Text(
                  'Ajustes',
                  style: SettingsTextStyle.title,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              SettingsTile(
                text: 'Compartir con amigos',
                onTap: () {
                 Share.share('Utilice nuestra aplicación para estudios universitarios fáciles. Descargar - https://apps.apple.com/us/app/counseluni-your-study-helper/id6478483367');
                },
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              SettingsTile(
                text: 'Política de privacidad',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ShowPageRead(url: 'https://docs.google.com/document/d/1I2pEnJkL_BJbw8MHxMiEHWiB-JS5PFDS9lx5lR5x_Uc/edit?usp=sharing'),
                    ),
                  );
                },
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              SettingsTile(
                text: 'Condiciones de uso',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const ShowPageRead(url: 'https://docs.google.com/document/d/1_xzD-XrPYZBwjbU86LVDutbL_1LxNNpH05hejW2UVHc/edit?usp=sharing'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
