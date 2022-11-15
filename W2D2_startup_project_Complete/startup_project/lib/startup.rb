require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        self.salaries.has_key?(title)
    end

    def >(other_startup)
        if self.funding > other_startup.funding
            return true
        else
            return false
        end
    end

    def hire(name, title)
        if !valid_title?(title)
            raise "Error: Title doesn't exist."
        else 
            employees << Employee.new(name, title)
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        payment = salaries[employee.title]

        if self.funding > payment
            employee.pay(payment)
            @funding -= payment 
        else
            raise "Error: Not enough funds."
        end
    end

    def payday
        employees.each { |employee| pay_employee(employee) }
    end

    def average_salary
        sum = 0
        employees.each { |employee| sum += salaries[employee.title] }
        sum / employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(other_startup)
        @funding += other_startup.funding

        other_startup.salaries.each do |title, amt|
            if !self.salaries.include?(title)
                salaries[title] = amt
            end
        end

        @employees += other_startup.employees
        other_startup.close
    end

end
