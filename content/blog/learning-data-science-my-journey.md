---
title: "Learning Data Science - My Journey"
summary: >
  My experiences while I was beginning to pursue a career in Data Science after
  graduation.
date: 2018-02-15T00:00:00+05:30
lastMod: 2022-08-18T00:00:00+05:30
categories:
- experience
---

### Preface

This article is about my experiences while I was beginning to pursue a career
in Data Science after graduation. At the end of every section, you'll find
links to corresponding courses. [^1]

### 0. The Beginning

It was the final year of my college. I was determined to start my career in
Haskell (a pure functional programming language) and become a type theorist in
the distant future by pursuing a PhD.

### 1. Machine Learning - Andrew Ng

Since everything in my career was planned, I said to myself, "Let's just take
the course on Machine Learning by Andrew Ng and start a new career in Data
Science". And I continued being a proud member of the [Magpie Developers
Group](https://blog.codinghorror.com/the-magpie-developer/). The article
was published in 2008. And it still holds true.

It is a 12 week long course. The course is often called a bird's eye view of
Machine Learning (ML). The exercises are in octave. The course primarily covers
three topics,

1. Supervised Learning
2. Unsupervised Learning
3. Best Practices

Both the depth and the breadth of content is remarkable. Andrew is an inspiring
teacher. One of his quotes got stuck in my mind.

- Artificial Intelligence is the new Electricity. - Andrew Ng

I am very passionate about automation. Electricity brought the first wave and
revolutionized everything. And I believe that Artificial Intelligence (AI) will
bring the next. After graduating from my college, I had several options.
Startup, Job, Masters, or PhD in the field of Data Science. I chose to stay at
home and study Data Science full-time.

- [Machine Learning - Andrew Ng](https://www.coursera.org/learn/machine-learning)

### 2. Reinforcement Learning - David Silver

While exploring the field of Data Science, I took several projects. I could not
finish some of them. I tried using both Supervised and Unsupervised Learning.
Neither was fitting in. That lead me to the third type of ML. Reinforcement
Learning (RL). Andrew's course did not cover that. I found a course on
[Reinforcement
Learning](https://www.youtube.com/playlist?list=PL7-jPKtc4r78-wCZcQn5IqyuWhBZ8fOxT)
by David Silver. It was accompanied by the book, [Reinforcement Learning: An
Introduction by Richard
Sutton](http://incompleteideas.net/book/bookdraft2017nov5.pdf). Even though I
worked on it full-time, I encountered enough problems to take more than a month
to complete both the book and the lectures. I watched the lectures twice to
understand RL completely.

There are 10 video lectures. The book has 17 chapters. A lot of research done
on this subject seems to be documented in form of research papers only (see
[OpenAI](https://openai.com/)).

RL in my opinion is closer to how we learn. By trial and error and by
experience. RL algorithms can use function approximation, which makes them
consumers of Supervised Learning. Whereas RL environments can use dimension
reduction, which makes them consumer of Unsupervised Learning. Once the RL
becomes mainstream, the programs will be
[godlike](https://www.youtube.com/watch?v=tXlM99xPQC8).

- [Reinforcement Learning - David Silver](https://www.youtube.com/playlist?list=PL7-jPKtc4r78-wCZcQn5IqyuWhBZ8fOxT)

### 3. Deep Learning (Learning Path) - Cognitive Class

Courses mentioned above helped me gain theoretical knowledge. I have been
programming the exercises in python, the usual [scipy](https://www.scipy.org/)
stack. It was time for implementing Neural Networks (NN) using
[tensorflow](https://www.tensorflow.org/).

I decided to follow [Deep
Learning](https://cognitiveclass.ai/learn/deep-learning/) (DL) learning path
provided by [Cognitive Class](https://cognitiveclass.ai/). I’d recommend this
path to anyone who wants to get into Deep Learning. It has 3 courses in it.

1. Deep Learning Fundamentals
2. Deep Learning with TensorFlow
3. Accelerating Deep Learning with GPU (in beta at the time of writing)

The first course is a good resource for learning various types of neural
networks (used in both supervised and unsupervised learning). It gives an
overview of various NN frameworks in python as well. The second one dives deep
into tensorflow explaining you how it’s done. The third one focuses on
performance side of the NNs by explaining how you can leverage GPUs and Cloud
(for both parallel and distributed execution).

After finishing the learning path, I realized that ML on cloud is going to be
the future. Many cloud providers started providing ML as a service a long time
ago. They offer pre-trained models (for predictions) for some of the popular
tasks like speech recognition, translation, and object recognition. After the
first stable release of tensorflow, it has become de facto framework for DL. It
is a low level framework. Google announced keras support for tensorflow in
2017. It is a higher level API and is widely used for rapid prototyping.

- [Deep Learning - Cognitive Class](https://cognitiveclass.ai/learn/deep-learning/)

### 4. Deep Learning Specialization - Andrew Ng

The ML course by Andrew Ng was launched in 2013. A lot of new algorithms and
best practices emerged since then. Machine Learning started becoming mainstream
and Deep Learning was catching up. There was a need of a DL course (which would
serve the purpose of the ML course by Andrew). Andrew and his team at
[deeplearning.ai](https://deeplearning.ai/) launched [Deep Learning
Specialization](https://www.coursera.org/specializations/deep-learning) in
2017. It uses python and [jupyter](http://jupyter.org/) notebooks for the
exercises. It consists of 5 courses.

1. Neural Networks and Deep Learning
2. Improving Deep Learning
3. Structuring Machine Learning Projects
4. Convolutional Neural Networks
5. Sequence Models

The first course focuses on the fundamentals of NN. It explains everything from
shallow and deep neural networks to forward and back propagations using numpy.
The second course focuses on hyperparameter tuning. It covers regularization,
dropout, gradients, optimizers, and the list goes on. The third course is about
project structure, error analysis and various practical topics not covered in
the courses above.

The fourth course explains the ins and outs of Convolutional Neural Network
(CNN). Its range spans from computer vision to various case studies and
renowned research papers, which I found amazing. I waited a month for the fifth
course to be released and let me tell you, it was worth the wait. It covers
Recurrent Neural Network (RNN), word embeddings, speech recognition and various
sequence models. The last two courses are the flagship of this specialization.

Topics mentioned in this section are just the tip of the iceberg. The courses
are free to access. But this specialization is worth paying for.

- [Deep Learning Specialization - Andrew Ng](https://www.coursera.org/specializations/deep-learning)

### 5. Data Scientist Track - DataCamp

While waiting for the last course in Deep Learning Specialization, I became
aware of [DataCamp](https://www.datacamp.com/)’s new year offer. I saw a few
free courses and the projects and was impressed. Even though I had been using
scipy stack for a long time, I had to google every time I got stuck somewhere.
DataCamp’s python tracks seemed to cover from the foundations to best
practices. They also offer courses in [R](https://www.r-project.org/). It’s a
goldmine to me. So I subscribed. I could finish all 4 skill tracks and all 3
career tracks (consisting of 20 courses) within 15 days. #BingeLearning.

A track is just a list of courses. There are 4 skill tracks (in python):

1. Python Programming (4 courses)
2. Importing & Cleaning Data (4 courses)
3. Data Manipulation (4 courses)
4. Machine Learning (4 courses)

Related courses are grouped as skill tracks. The first skill track focuses on
the basics of the python language, [numpy](http://www.numpy.org/),
[pandas](https://pandas.pydata.org/), and
[matplotlib](https://matplotlib.org/). It covers
syntax, semantics, functions, errors, scoping, arrays, data-frames, and
plotting. The second skill track is about getting data from CSV, Excel, Web
(scraping), APIs (JSON), SQL (databases), and cleaning data using pandas.

The third skill track covers pandas foundations and
[sqlalchemy](https://www.sqlalchemy.org/). The fourth skill track covers
supervised and unsupervised learning using
[scikit-learn](http://scikit-learn.org/) as well as deep learning using keras.
It has a course on ML from experts, which breaks the myth of only complicated
models winning ML competitions.

There are 3 career tracks:

1. Python Programmer (10 courses)
2. Data Analyst (10 from Python Programmer + 3 = 13 courses)
3. Data Scientist (13 from Data Analyst + 7 = 20 courses)

A career track is list of courses to complete to be able to start a career in
respective field. I started from Python Programmer and worked my way to Data
Scientist. Shorter goals help, and I’d recommend you the same.

I liked DataCamp’s exercises. The checker is pedantic sometimes but it never
got in my way. You get a python environment with all dependencies installed to
do the exercises and check them online. DataCamp’s Data Scientist track ends
where Andrew’s Deep Learning Specialization starts with some overlap.

- [Data Scientist Track - DataCamp](https://www.datacamp.com/tracks/data-scientist-with-python)

### 6. Data Scientist - DataQuest

I learned a lot while completing the above courses and specializations. I
recently started learning from DataQuest, a platform similar to DataCamp.
[DataQuest](https://www.dataquest.io/) seems to offer a lot more than just the
Data Science specific content. I will update this section once I finish all of
it [^2].

- [Data Scientist - DataQuest](https://dataquest.io/)

### 7. Conclusion

This is my first article [^3]. Before writing it I thought documenting my
journey won’t be that helpful to others. I shared a draft with my friends and
the responses were positive. Thanks [Varun Barad](https://varunbarad.com) and
[Dixita Ganatra](https://dixita.dev).

[Divyesh Peshavaria](https://divyesh.dev) mentioned that I should include
details of the projects as well. I am thinking to publish an article for each
project in near future. Maybe a series [^4].

[^1]: I no longer hold some opinions shared in the article.
[^2]: I never got to complete it.
[^3]: The article was originally published on Medium.
[^4]: Very less likely to happen though.
