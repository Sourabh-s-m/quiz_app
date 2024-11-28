const { createApp } = Vue

const API_BASE_URL = 'http://localhost:8080/api';

createApp({
    data() {
        return {
            isAuthenticated: false,
            user: null,
            currentView: 'topics',
            topics: [],
            questions: [],
            currentQuestionIndex: 0,
            selectedAnswer: null,
            userAnswers: [],
            score: 0,
            loading: false,
            error: null,
            resultMessage: '',
            logoutMessage: ''
        }
    },
    computed: {
        currentQuestion() {
            return this.questions[this.currentQuestionIndex] || null;
        },
        progressPercentage() {
            return (this.currentQuestionIndex + 1) / this.questions.length * 100;
        }
    },
    methods: {
        async loginWithGoogle() {
            try {
                this.loading = true;
                this.error = null;

                const response = await fetch(`${API_BASE_URL}/google-auth.php`);

                const rawText = await response.text();

                let data;
                try {
                    data = JSON.parse(rawText);
                } catch (e) {
                    throw new Error(`Invalid JSON response: ${rawText.substring(0, 100)}...`);
                }

                if (data.status === 'error') {
                    throw new Error(data.message);
                }

                if (!data.url) {
                    throw new Error('No authentication URL received');
                }

                window.location.href = data.url;

            } catch (error) {
                this.error = `Failed to initialize login: ${error.message}`;
            } finally {
                this.loading = false;
            }
        },
        async loadTopics() {
            try {
                this.loading = true;
                this.error = null;

                const response = await fetch(`${API_BASE_URL}/topics.php`);

                const rawText = await response.text();

                let data;
                try {
                    data = JSON.parse(rawText);
                } catch (e) {
                    throw new Error(`Invalid JSON response: ${rawText.substring(0, 100)}...`);
                }

                if (data.status === 'error') {
                    throw new Error(data.message);
                }

                if (!data.data) {
                    throw new Error('No topics data received');
                }

                this.topics = data.data;

            } catch (error) {
                this.error = 'Failed to load topics: ' + error.message;
            } finally {
                this.loading = false;
            }
        },
        async selectTopic(topicId) {
            try {
                this.loading = true;
                this.error = null;

                const response = await fetch(`${API_BASE_URL}/questions.php?topic_id=${topicId}`);
                const data = await response.json();

                if (data.status === 'error') {
                    throw new Error(data.message);
                }

                if (!data.data || !Array.isArray(data.data) || data.data.length === 0) {
                    throw new Error('No questions available for this topic');
                }

                this.questions = data.data;
                this.currentQuestionIndex = 0;
                this.selectedAnswer = null;
                this.userAnswers = new Array(this.questions.length).fill(null);
                this.currentView = 'quiz';

            } catch (error) {
                this.error = 'Failed to load questions: ' + error.message;
            } finally {
                this.loading = false;
            }
        },
        previousQuestion() {
            if (this.currentQuestionIndex > 0) {
                this.currentQuestionIndex--;
                this.updateQuestion();
            }
        },
        nextQuestion() {
            if (this.selectedAnswer !== null) {
                this.userAnswers[this.currentQuestionIndex] = {
                    question_id: this.questions[this.currentQuestionIndex].id,
                    selected_answer: this.selectedAnswer
                };
                if (this.currentQuestionIndex < this.questions.length - 1) {
                    this.currentQuestionIndex++;
                    this.updateQuestion();
                } else {
                    this.submitQuiz();
                }
            }
        },
        async checkAuthStatus() {
            try {
                const response = await fetch(`${API_BASE_URL}/check-auth.php`);
                const data = await response.json();
                if (data.authenticated) {
                    this.isAuthenticated = true;
                    this.user = data.user;
                    await this.loadTopics();
                }
            } catch (error) {
                this.error = 'Failed to check authentication status';
            }
        },
        async logout() {
            try {
                await fetch(`${API_BASE_URL}/logout.php`);
                this.isAuthenticated = false;
                this.user = null;
                this.currentView = 'topics';
                document.getElementById('toast-container').innerHTML = 'You have been logged out successfully.';
                this.showToast(this.logoutMessage);
                window.location.reload();
            } catch (error) {
                this.error = 'Failed to logout';
            }
        },
        async submitQuiz() {
            try {
                if (this.currentQuestionIndex === this.questions.length - 1) {
                    this.userAnswers[this.currentQuestionIndex] = {
                        question_id: this.questions[this.currentQuestionIndex].id,
                        selected_answer: this.selectedAnswer
                    };
                }

                const quizData = {
                    answers: this.userAnswers,
                };

                const response = await fetch(`${API_BASE_URL}/submit_quiz.php`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify(quizData),
                });

                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }

                const data = await response.json();

                if (data.status === 'success') {
                    this.score = data.score;
                    this.resultMessage = data.message;
                    this.currentView = 'results';
                } else {
                    this.error = data.message;
                }
            } catch (error) {
                console.error('Error submitting quiz:', error);
            }
        },
        restartQuiz() {
            this.currentView = 'topics';
            this.questions = [];
            this.currentQuestionIndex = 0;
            this.selectedAnswer = null;
            this.userAnswers = [];
            this.score = 0;
            this.error = null;
        },
        updateQuestion() {
            this.selectedAnswer = this.userAnswers[this.currentQuestionIndex]?.selected_answer || null;
        },
        showToast(message) {
            console.log(`Toast message: ${message}`);
        }
    },
    watch: {
        currentQuestionIndex(newIndex) {
            this.updateQuestion();
        }
    },
    async mounted() {
        await this.checkAuthStatus();

        if (window.location.hash === '#success') {
            await this.checkAuthStatus();
            history.pushState("", document.title, window.location.pathname);
        } else if (window.location.hash === '#error') {
            this.error = 'Login failed';
            history.pushState("", document.title, window.location.pathname);
        }
    }
}).mount('#app') 