class KanjiConstants {
  /*
	The kanji grade level. 1 through 6 indicates a Kyouiku kanji
	and the grade in which the kanji is taught in Japanese schools. 
	8 indicates it is one of the remaining Jouyou Kanji to be learned 
	in junior high school, and 9 or 10 indicates it is a Jinmeiyou (for use 
	in names) kanji. [G]
	*/
  static String? getLabelListType(int grade) {
    if (grade >= 1 && grade <= 8) {
      return 'Jōyō';
    } else if (grade >= 9 && grade <= 10) {
      return 'Jinmeiyō';
    }
    return null;
  }

  static String? getLabelKyouiku(int grade) {
    if (grade >= 1 && grade <= 6) {
      return 'Kyōiku';
    }
    return null;
  }

  static String? getLabelGrade(int grade) {
    String gradeText = '';
    switch (grade) {
      case 1:
        gradeText = '1';
        break;
      case 2:
        gradeText = '2';
        break;
      case 3:
        gradeText = '3';
        break;
      case 4:
        gradeText = '4';
        break;
      case 5:
        gradeText = '5';
        break;
      case 6:
        gradeText = '6';
        break;
    }

    if (gradeText == '') {
      return null;
    }

    return 'Grade $gradeText';
  }

  static String? getLabelJLPT(int jlpt) {
    String jlptText = '';
    switch (jlpt) {
      case 1:
        jlptText = '1';
        break;
      case 2:
        jlptText = '2';
        break;
      case 3:
        jlptText = '3';
        break;
      case 4:
        jlptText = '4';
        break;
      case 5:
        jlptText = '5';
        break;
    }

    if (jlptText == '') {
      return null;
    }

    return 'JLPT N$jlptText';
  }
}
