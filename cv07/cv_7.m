data = readtable('insurance.csv');

charges_smokers = data(data.smoker == "yes", :).charges;
charges_nonsmokers = data(data.smoker == "no", :).charges;

age_smokers = data(data.smoker == "yes", :).age;
age_nonsmokers = data(data.smoker == "no", :).age;

bmi_smokers = data(data.smoker == "yes", :).bmi;
bmi_nonsmokers = data(data.smoker == "no", :).bmi;

[k_age_smokers,q_age_smokers] = lin_regression(age_smokers, charges_smokers);
[k_age_nonsmokers,q_age_nonsmokers] = lin_regression(age_nonsmokers, charges_nonsmokers);
[k_bmi_smokers,q_bmi_smokers] = lin_regression(bmi_smokers,charges_smokers);
[k_bmi_nonsmokers,q_bmi_nonsmokers] = lin_regression(bmi_nonsmokers, charges_nonsmokers);

x_age_smokers = min(age_smokers):max(age_smokers);
y_age_smokers = k_age_smokers * x_age_smokers + q_age_smokers;

x_age_nonsmokers = min(age_nonsmokers):max(age_nonsmokers);
y_age_nonsmokers = k_age_nonsmokers * x_age_nonsmokers + q_age_nonsmokers;

x_bmi_smokers = min(bmi_smokers):max(bmi_smokers);
y_bmi_smokers = k_bmi_smokers * x_bmi_smokers + q_bmi_smokers;

x_bmi_nonsmokers = min(bmi_nonsmokers):max(bmi_nonsmokers);
y_bmi_nonsmokers = k_bmi_nonsmokers * x_bmi_nonsmokers + q_bmi_nonsmokers;

figure;
hold on;
scatter(age_smokers, charges_smokers, 'r', 'filled');
scatter(age_nonsmokers, charges_nonsmokers, 'b', 'filled');
plot(x_age_smokers, y_age_smokers, 'r');
plot(x_age_nonsmokers, y_age_nonsmokers, 'b');
xlabel('Age');
ylabel('Charges');
legend('Smokers', 'Non-Smokers', 'Smokers Regression Line', 'Non-Smokers Regression Line');
saveas(gcf, 'graph_age.png');

figure;
hold on;
scatter(bmi_smokers, charges_smokers, 'r', 'filled');
scatter(bmi_nonsmokers, charges_nonsmokers, 'b', 'filled');
plot(x_bmi_smokers, y_bmi_smokers, 'r');
plot(x_bmi_nonsmokers, y_bmi_nonsmokers, 'b');
xlabel('BMI');
ylabel('Charges');
legend('Smokers', 'Non-Smokers', 'Smokers Regression Line', 'Non-Smokers Regression Line');
saveas(gcf, 'graph_bmi.png');