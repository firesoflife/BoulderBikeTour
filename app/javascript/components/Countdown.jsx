import React, { useState, useRef, useEffect } from 'react';

const Countdown = () => {
	const [timerMonths, setTimerMonths] = useState('00');
	const [timerDays, setTimerDays] = useState('00');
	const [timerHours, setTimerHours] = useState('00');
	const [timerMinutes, setTimerMinutes] = useState('00');
	const [timerSeconds, setTimerSeconds] = useState('00');

	let interval = useRef();

	const startTimer = () => {
		const countdownDate = new Date('April 1, 2022 10:15:00').getTime();

		interval = setInterval(() => {
			const now = new Date().getTime();
			const distance = countdownDate - now;

			const months = Math.floor(distance / (60 * 60 * 24 * 7 * 4) / 1000);

			const days = Math.floor(distance / (1000 * 60 * 60 * 24));

			const hours = Math.floor(
				(distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)
			);
			const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
			const seconds = Math.floor((distance % (1000 * 60)) / 1000);

			if (distance < 0) {
				// The Day Has Arrived
				clearInterval(interval.current);
			} else {
				// update timer
				setTimerMonths(months);
				setTimerDays(days);
				setTimerHours(hours);
				setTimerMinutes(minutes);
				setTimerSeconds(seconds);
			}
		}, 1000);
	};

	// componentDidMount
	useEffect(() => {
		startTimer();
		return () => {
			clearInterval(interval.current);
		};
	});

	return (
		<div className='container'>
			<div className='counter-container'>
				<h1 className='counter-title'>
					Get Set! The biggest race even of the year begins in:
				</h1>
				<div className='counter-box'>
					<div className='time-box'>
						<h2 className='time-unit'>Months</h2>
						<p className='time-number'>{timerMonths}</p>
					</div>
					<div className='time-box'>
						<h2 className='time-unit'>Days</h2>
						<p className='time-number'>{timerDays}</p>
					</div>
					<div className='time-box'>
						<h2 className='time-unit'>Hours</h2>
						<p className='time-number'>{timerHours}</p>
					</div>
					<div className='time-box'>
						<h2 className='time-unit'>Minutes</h2>
						<p className='time-number'>{timerMinutes}</p>
					</div>
					<div className='time-box'>
						<h2 className='time-unit'>Seconds</h2>
						<p className='time-number'>{timerSeconds} </p>
					</div>
				</div>
			</div>
		</div>
	);
};

export default Countdown;
