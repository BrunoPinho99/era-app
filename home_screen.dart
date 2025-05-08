import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            _header(),
            const SizedBox(height: 15),
            _searchBar(),
            const SizedBox(height: 20),
            _sectionTitle("Melhores Treinos"),
            _trainingCarousel(context),
            const SizedBox(height: 20),
            _sectionTitle("Desafios"),
            _challengeRow(),
            const SizedBox(height: 19),
            _sectionTitle("Fast Warmup"),
            _fastWarmupList(context),
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  Widget _header() {
    return Text(
      "Bom dia! 🔥\nFulana de Tal",
      style: const TextStyle(
        fontFamily: 'AlbraDisplay',
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _searchBar() {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 243, 243, 243),
        hintText: "Pesquisar treino",
        prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.montserrat(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _trainingCarousel(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _trainingCard(
            context,
            title: "",
            imagePath: "assets/training.png",
          ),
          _trainingCard(
            context,
            title: "",
            imagePath: "assets/training.png",
          ),
        ],
      ),
    );
  }

  Widget _trainingCard(BuildContext context, {required String title, required String imagePath}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const WorkoutScreen()),
        );
      },
      child: Container(
        width: 280,
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            const Center(
              child: Icon(
                Icons.play_circle_fill,
                color: Colors.white,
                size: 40,
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                title,
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _challengeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _challengeCard("assets/squat_challenge.png"),
        _challengeCard("assets/sprint_challenge.png"),
        _challengeCard("assets/plank_challenge.png"),
      ],
    );
  }

  Widget _challengeCard(String imagePath) {
    return Container(
      width: 112,
      height: 112,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Image.asset(imagePath, fit: BoxFit.contain),
    );
  }

  Widget _fastWarmupList(BuildContext context) {
    return Column(
      children: [
        _fastWarmupCard(
          context,
          title: "Exercícios de Pernas",
          duration: "10 min",
          level: "Iniciante",
          description: "Este aquecimento foca em ativar os músculos das pernas, preparando-os para um treino intenso. Ideal para iniciantes que desejam melhorar a mobilidade e a força.",
          imagePath: "assets/warmup_legs.png",
        ),
        _fastWarmupCard(
          context,
          title: "Lunges para Trás",
          duration: "5 min",
          level: "Iniciante",
          description: "Os lunges para trás ajudam a aquecer os glúteos e os quadríceps, melhorando a estabilidade e a flexibilidade. Perfeito para um aquecimento rápido antes de qualquer treino.",
          imagePath: "assets/warmup_lunges.png",
        ),
      ],
    );
  }
  

  Widget _fastWarmupCard(
    BuildContext context, {
    required String title,
    required String duration,
    required String level,
    required String description,
    required String imagePath,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WarmupScreen(
              title: title,
              description: description,
              imagePath: imagePath,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 2),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "$duration - $level",
                  style: GoogleFonts.montserrat(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.play_circle_fill,
              color: Colors.red,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: const Color.fromARGB(255, 31, 31, 31),
      selectedItemColor: Colors.red,
      unselectedItemColor: const Color.fromARGB(255, 234, 234, 234),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
      ],
    );
  }
}

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1F24),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1F24),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Treino",
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage("assets/workout_thumb.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.play_circle_fill,
                  color: Colors.white,
                  size: 60,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "TREINO PARA A PARTE INFERIOR DO CORPO",
              style: GoogleFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "O abdômen inferior e os quadris são as áreas mais difíceis\n"
              "do corpo para reduzir quando estamos de dieta.\n"
              "Mesmo assim, nessa área, especialmente nas pernas como um todo,\n"
              "você pode reduzir o peso mesmo sem usar ferramentas.",
              style: GoogleFonts.montserrat(
                fontSize: 16,
                color: Colors.white70,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WarmupScreen extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const WarmupScreen({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1F24),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1F24),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Aquecimento",
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.play_circle_fill,
                  color: Colors.white,
                  size: 60,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              title.toUpperCase(),
              style: GoogleFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: GoogleFonts.montserrat(
                fontSize: 16,
                color: Colors.white70,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}