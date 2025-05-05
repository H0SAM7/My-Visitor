import 'package:flutter/material.dart';
import 'package:my_visitor/generated/l10n.dart';

class FAQ {
  final String question;
  final String answer;

  const FAQ({required this.question, required this.answer});
}

List<FAQ> getFaqs(BuildContext context) {
  final local = S.of(context);

  return [
    FAQ(
      question: local.faq_question_1,
      answer: local.faq_answer_1,
    ),
    FAQ(
      question: local.faq_question_2,
      answer: local.faq_answer_2,
    ),
    FAQ(
      question: local.faq_question_3,
      answer: local.faq_answer_3,
    ),
    FAQ(
      question: local.faq_question_4,
      answer: local.faq_answer_4,
    ),
    FAQ(
      question: local.faq_question_5,
      answer: local.faq_answer_5,
    ),
    FAQ(
      question: local.faq_question_6,
      answer: local.faq_answer_6,
    ),
    FAQ(
      question: local.faq_question_7,
      answer: local.faq_answer_7,
    ),
    FAQ(
      question: local.faq_question_8,
      answer: local.faq_answer_8,
    ),
    FAQ(
      question: local.faq_question_9,
      answer: local.faq_answer_9,
    ),
    FAQ(
      question: local.faq_question_10,
      answer: local.faq_answer_10,
    ),
    FAQ(
      question: local.faq_question_11,
      answer: local.faq_answer_11,
    ),
    FAQ(
      question: local.faq_question_12,
      answer: local.faq_answer_12,
    ),
    FAQ(
      question: local.faq_question_13,
      answer: local.faq_answer_13,
    ),
    FAQ(
      question: local.faq_question_14,
      answer: local.faq_answer_14,
    ),
    FAQ(
      question: local.faq_question_15,
      answer: local.faq_answer_15,
    ),
  ];
}
